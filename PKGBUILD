# Maintainer: MGislv <nocentinigabriele91@gmail.com>
# Contributor: Nikola Hadžić <nikola@firemail.cc>

pkgname=reddio
pkgver=0.46
pkgrel=1
pkgdesc="A command-line interface for Reddit written in POSIX sh"
arch=('any')
url="https://gitlab.com/aaronNG/reddio"
license=('MIT')
conflicts=('reddio-git')
depends=('curl' 'jq') 
optdepends=('gnu-netcat: for authentication'
            'openbsd-netcat: for authentication'
	    'bash: POSIX compliant shell'
	    'dash: POSIX compliant shell'
	    'ksh: POSIX compliant shell')
source=(https://gitlab.com/aaronNG/$pkgname/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz
	lib_dir.patch)
sha512sums=("1b782b57c701d74769a5bbd0702f4eed92b5557f10309bee0076791bc4cb2f133d0b7b979a573a9eccb172afde09ac3adf73db6ecf9354211f53a0e9870322c3"
            "ddbe50b279027ed76e8ce14516d3d8dfba79bfc306f9cbb9d782f31573e3ca14bccc03403a2dac393e2ec2798b1db17064fa618eb5b17cfd14c2aa37bb3e0ef3")

prepare() {
	cd "$pkgname-v$pkgver"
	patch --forward --strip=1 --input="$srcdir"/lib_dir.patch
}

package() {
	cd "$pkgname-v$pkgver"
	PREFIX="$pkgdir"/usr make install

	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}

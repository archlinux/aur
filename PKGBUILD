# Maintainer: KiWi42 <pullthisplug dash aur at yahoo dot com>

pkgname=netexec
pkgver=1.5.1
pkgrel=1
pkgdesc="A swiss army knife for pentesting Windows/Active Directory environments"
arch=("x86_64")
url="https://github.com/Pennyw0rth/NetExec"
license=("BSD-2-Clause")
replaces=("crackmapexec")
makedepends=('git' 'rust' 'python-pip' 'python-virtualenv')
options=('!strip')
source=("${pkgname}::git+${url}.git#tag=v${pkgver}"
        "zsh-completion")
sha256sums=("SKIP"
            "c0231c100ca2ba559df22a94c229afb230467ba5153f1652755edd32273e9da4")

build() {
	cd "$pkgname"
	virtualenv venv
	source venv/bin/activate
	pip install pyinstaller .
	pyinstaller netexec.spec
}


package() {
	install -Dm 644 zsh-completion "$pkgdir/usr/share/zsh/site-functions/_nxc"
    cd "$pkgname"
	install -Dm 755 dist/nxc "$pkgdir/usr/bin/nxc"
	install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

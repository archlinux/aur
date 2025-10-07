# Maintainer: Dae Euhwa <github.com/daedaevibin>

pkgname=bdf2psf-latest
pkgver=1.242
pkgrel=1
epoch=1
pkgdesc='Debian utility to convert BDF font files to PSF format'
arch=('any')
url="https://packages.debian.org/unstable/bdf2psf"
depends=('perl' 'libbsd')
license=('GPL2')
source=("https://deb.debian.org/debian/pool/main/c/console-setup/bdf2psf_${pkgver}_all.deb"
       "0001-print-help-when-no-args-provided.patch")
b2sums=('71bbffa0063b209911178873a6adfb3cb5b92956537751f4a635386c8f8606485fafb6b796e24037bcc747f372a9c0089bfce2b03ae9a343ca7644cb0a1a9eb9'
        '332248177ed0f2caf12fe4d2ccc44d973b52ba9c6c47735976e281e5a05cf43ff375e7a68ec7fe07f0d7c7a7c363e0bd68f7b3a723ed1287063443ce456fe071')

prepare() {
	bsdtar -xvf data.tar.xz "./usr/bin/bdf2psf"
	patch -Np1 -i 0001-print-help-when-no-args-provided.patch
}

package() {
	bsdtar -xvf data.tar.xz -C "$pkgdir" --exclude './usr/bin'
	install -Dm755 usr/bin/bdf2psf -t "$pkgdir/usr/bin/"
}

# Maintainer: Dae Euhwa <daedaevibin@naver.com>

pkgname=bdf2psf-latest
pkgver=1.246
pkgrel=1
epoch=1
pkgdesc='Debian utility to convert BDF font files to PSF format'
arch=('any')
url="https://packages.debian.org/unstable/bdf2psf"
depends=('perl' 'libbsd')
license=('GPL-2.0-or-later')
source=("https://deb.debian.org/debian/pool/main/c/console-setup/bdf2psf_${pkgver}_all.deb"
       "0001-print-help-when-no-args-provided.patch")
b2sums=('2e76577054bdbf101d1c1605f35ee830ac2814cc18e436deeff4b82c697e42471c6f3c38a1e08f239320633e3adffaa5dddba145b16d18380eb8639cca658a85'
        '332248177ed0f2caf12fe4d2ccc44d973b52ba9c6c47735976e281e5a05cf43ff375e7a68ec7fe07f0d7c7a7c363e0bd68f7b3a723ed1287063443ce456fe071')

prepare() {
	bsdtar -xvf data.tar.xz "./usr/bin/bdf2psf"
	patch -Np1 -i 0001-print-help-when-no-args-provided.patch
}

package() {
	bsdtar -xvf data.tar.xz -C "$pkgdir" --exclude './usr/bin'
	install -Dm755 usr/bin/bdf2psf -t "$pkgdir/usr/bin/"
}

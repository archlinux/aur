# Maintainer: Square252 <square@0xfc.de>

pkgname='solokeys-udev-git'
pkgver=20190308.c7f0d05
pkgrel=2
pkgdesc='Official SoloKey udev rules. (from Github repo)'
arch=('any')
url='https://github.com/solokeys/solo'
license=('Apache' 'MIT')
depends=('udev')
makedepends=('git')
provides=("$pkgname")
conflicts=("$pkgname" "solokeys-udev")
sha256sums=('SKIP'
            '0afcd39efc916b370472d15453c668f4ad9634ef92d9e5ede2d8d6a883af5625')
source=('git+https://github.com/solokeys/solo'
        'solokeys-udev.install')
install='solokeys-udev.install'

pkgver() {
	cd "$srcdir/solo/udev/"
	printf $(git log -1 --format=%cd.%h --date=short 70-solokeys-access.rules |tr -d -)
}

package() {
  install -Dm 644 "${srcdir}/solo/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 "${srcdir}/solo/LICENSE-MIT" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
  install -Dm 644 "${srcdir}/solo/LICENSE-APACHE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
  install -m755 -d "${pkgdir}/usr/lib/udev/rules.d"
  install -m644 "${srcdir}/solo/udev/70-solokeys-access.rules" "${pkgdir}/usr/lib/udev/rules.d/"
}

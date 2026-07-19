# Maintainer: MaoYaoTang <maoyaotang@163.com>

pkgname=modern-weather-enhanced
pkgver=v1.0.7.r53.gc26ef7e
pkgrel=2
epoch=1
pkgdesc="Weather widget for KDE Plasma with meteogram and extensive customization"
arch=('any')
url='https://github.com/samy879/modern-weather-enhanced'
license=('GPL-2.0-or-later')
depends=('plasma-workspace' 'plasma5support' 'libplasma' 'kirigami'
         'kcmutils' 'qt6-declarative' 'qt6-5compat')
makedepends=('gettext')
source=("git+$url.git")
sha256sums=('SKIP')

_plasmoid=com.github.samy879.minimalist-animated-weather

pkgver() {
  cd $pkgname
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd $pkgname
    sh translate/tools/build.sh
}

package() {
    cd $pkgname
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -m755 -d ${pkgdir}/usr/share/plasma/plasmoids/${_plasmoid}
    cp -r contents metadata.json -t "${pkgdir}/usr/share/plasma/plasmoids/${_plasmoid}/"
}

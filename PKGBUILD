# Maintainer: Hilary Jendrasiak <sylogista@sylogista.pl>
pkgname='noaa-apt'
pkgdesc='NOAA APT image decoder with GUI'
pkgver=1.1.0
pkgrel=1
arch=('x86_64') 
url="https://github.com/martinber/${pkgname}"
license=('GPL3')
depends=('gsl' 'gtk3')
makedepends=('cargo')
source=("${url}/archive/v${pkgver}.tar.gz")
sha512sums=('64915709470e3b8dd74b2927056d4a03e302f34374dfb279b4e4d561fed774ba3020d32289730835d5ce842c7b6ab9873f682754bc29a027dd5e6b7ef5fb16c3')

build()
{
    cd "${srcdir}/${pkgname}-${pkgver}"
    cargo build --release
}

package()
{
    cd "${srcdir}/${pkgname}-${pkgver}/"
    install -Dm755 "target/release/${pkgname}" "$pkgdir/usr/bin/${pkgname}"
    install -Dm644 "debian/ar.com.mbernardi.noaa-apt.desktop" "$pkgdir/usr/bin/usr/share/applications"
    #install -Dm644 "debian/noaa-apt.png" "$pkgdir/usr/share/icons/hicolor/48x48/apps"
    #install -Dm644 "debian/noaa-apt.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps"
}

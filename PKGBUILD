# Maintainer: Hilary Jendrasiak <sylogista@sylogista.pl>
pkgname='noaa-apt'
pkgdesc='NOAA APT image decoder with GUI'
pkgver=1.0.0
pkgrel=2 
arch=('x86_64') 
url="https://github.com/martinber/${pkgname}"
license=('GPL3')
depends=('gsl' 'gtk3')
makedepends=('cargo')
source=("${url}/archive/v${pkgver}.tar.gz")
sha512sums=('747349ad4a57b3d706646e95c7ec69e68518d10e621031bdbaed30e1ac7db9f0f9a9960e93b2cde6b8b1bee4a85fe2ba70159d3f4fea461bb7d1b79edb3c7cd1')

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
    install -Dm644 "debian/noaa-apt.png" "$pkgdir/usr/share/icons/hicolor/48x48/apps"
    install -Dm644 "debian/noaa-apt.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps"
}

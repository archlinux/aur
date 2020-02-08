# Maintainer: Hilary Jendrasiak <sylogista@sylogista.pl>
pkgname='noaa-apt'
pkgdesc='NOAA APT image decoder with GUI'
pkgver=1.1.2
pkgrel=1
arch=('x86_64') 
url="https://github.com/martinber/${pkgname}"
license=('GPL3')
depends=('gsl' 'gtk3')
makedepends=('cargo' 'rustup')
source=("${url}/archive/v${pkgver}.tar.gz")
sha512sums=('59add018617af7f0ee022c3dd39d14c2f4306de6364fcd2e604b6b064b5296acc41d0a46fc55f37263b64189a687a5b3636fd65721960f70926e45f1615866d4')

build()
{
	export RUSTUP_HOME="$srcdir/.rustup/" 
	rustup install nightly

    cd "${srcdir}/${pkgname}-${pkgver}"
    cargo +nightly build --release
}

package()
{
    cd "${srcdir}/${pkgname}-${pkgver}/"
    install -Dm755 "target/release/${pkgname}" "$pkgdir/usr/bin/${pkgname}"
    install -Dm644 "debian/ar.com.mbernardi.noaa-apt.desktop" "$pkgdir/usr/bin/usr/share/applications"
}


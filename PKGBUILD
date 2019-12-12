# Maintainer: Hilary Jendrasiak <sylogista@sylogista.pl>
pkgname='noaa-apt'
pkgdesc='NOAA APT image decoder with GUI'
pkgver=1.1.1
pkgrel=1
arch=('x86_64') 
url="https://github.com/martinber/${pkgname}"
license=('GPL3')
depends=('gsl' 'gtk3')
makedepends=('cargo' 'rustup')
source=("${url}/archive/v${pkgver}.tar.gz")
sha512sums=('ec01c9cc5dfc19cfa1e15a7ce6f81c21aba2cccc79e34a25c2a58e0a3748f2ffc8bad4c094d7e14079c3aeab270e0419acbfbba4f1dcfe3c9f16fc9227f2151e')

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


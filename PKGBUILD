# Maintainer: Silvio Ankermann < silvio at booq dot org >

pkgname=prosody-filer
pkgver=1.0.2
pkgrel=2
pkgdesc='Golang mod_http_upload_external server for Prosody'
url='https://github.com/ThomasLeister/prosody-filer'
license=('MIT')
arch=('i686' 'x86_64')
makedepends=(go)
backup=("etc/prosody-filer.toml")
install=prosody-filer.install
source=("git+https://github.com/ThomasLeister/${pkgname}.git#tag=v${pkgver}"
	"prosody-filer.service")
sha256sums=('SKIP'
            '3f64c61eb4bd0d801c8a24d4bf3eae1e04c82ade000d363081d0d673eaaabe9f')

prepare() {
    cd "${pkgname}"
    if [ ! -e go.mod ]; then
    	go mod init prosody-filer
    fi
}

build() {
    cd "${pkgname}"
    export GOFLAGS="-trimpath"
    ./build.sh
}

package() {
    install -D -m755 ${pkgname}/prosody-filer "${pkgdir}/usr/bin/prosody-filer"
    install -D -m644 ${pkgname}/config.example.toml "${pkgdir}/etc/prosody-filer.toml"
    install -D -m644 prosody-filer.service "${pkgdir}/usr/lib/systemd/system/prosody-filer.service"
}

pkgname=jdk8-j9-bin
pkgver=8.0.6.5
_pkgver=$(sed -e 's/\./-/2' <<<${pkgver})
pkgrel=1
pkgdesc="IBM® SDK, Java Technology Edition, Version 8"
arch=('x86_64')
url="https://developer.ibm.com/javasdk/downloads/sdk8/"
license=('custom')
depends=('java-environment-common' 'ca-certificates-utils' 'nss')
provides=(
'java-environment=8'
'java-runtime=8'
'java-runtime-headless=8'
)
makedepends=('coreutils' 'bash')
source=("install_${pkgver}.bin::https://public.dhe.ibm.com/ibmdl/export/pub/systems/cloud/runtimes/java/${pkgver}/linux/x86_64/ibm-java-sdk-${_pkgver}-x86_64-archive.bin")
sha256sums=('a640a2fbdb3cef7faa68f9349060ca5f7ce403ca351c599f6bdd28ba0b9cfd8b')

package() {
	cd "$srcdir"
    chmod +x install_${pkgver}.bin
    mkdir -p "${pkgdir}/usr/lib/jvm/java-8-j9"
    ./install_${pkgver}.bin -i silent -DLICENSE_ACCEPTED=TRUE -DUSER_INSTALL_DIR="${pkgdir}/usr/lib/jvm/java-8-j9"
    mkdir -p "${pkgdir}/usr/share/licenses"
    ln -s ../../lib/jvm/java-8-j9/license_en.txt "${pkgdir}/usr/share/licenses/jdk8-j9"
}


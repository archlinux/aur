# Maintainer: Ben Mitchell (bjosephmitchell@gmail.com)
pkgname=muse-hub-bin
pkgver=1.0.0.392
pkgrel=3
pkgdesc="Manage MuseScore Libraries."
arch=('x86_64')
url=""
provides=("muse-hub")
license=()
groups=()
depends=()
options=('!strip' 'emptydirs')
install=${pkgname}.install
source=("https://pub-c7a32e5b5d834ec9aeef400105452a42.r2.dev/Muse_Hub.deb" "muse-hub.service" "muse-hub.desktop")
sha512sums=(
	'8c3b145d4350e70d75548ee174331ff6bbf022cfc0dfd338828c62e99a860fed37254c55b75ac10d0e3f4475dd93e79de22a52fb6fdb5ad78d8b86de9f50f836'
	'd35bcc2ea0032f003d70c885e258671b69d4e8b0d66135876a828ce429c581ba063f7b02c01a0d27155f7a53dc3964afcd2b193958602819f780f8c8e0ad1365'
	'e880ed5b5c7c2f7fa78d9a3f4cb3e438b7dc1321c6e2470644d9f0ff96fe060dd34640ab0da1349d004c65179cd9b89790242a77b09adf03e5178be63d59817d'
)

package(){
	# Extract package data
	tar -xJ -f data.tar.xz -C "${pkgdir}"
	install -Dm644 muse-hub.service "${pkgdir}/usr/lib/systemd/system/muse-hub.service"
	install -Dm644 muse-hub.desktop "${pkgdir}/usr/share/applications/muse-hub.desktop"

  # Make sure directory used by Muse Hub and MuseScore has been created
  # so we can bind it into a temporary filesystem for the service
  mkdir -p "${pkgdir}/srv/muse-hub"
	mkdir -p "${pkgdir}/var/lib/MuseSampler"
}

# Maintainer: Ben "crispyrice" Mitchell (bjosephmitchell@gmail.com)
pkgname=muse-hub-bin
pkgver=1.0.1.451
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
source=("muse-hub-$pkgver-$pkgrel.deb::https://muse-cdn.com/Muse_Hub.deb" "muse-hub.service" "muse-hub.desktop")
sha512sums=(
	'a536bec895bfae4c29c13ab6359c0f35b6e94dd1a59dc9f0a0525244ca65a61452f3d7d8bc02f18a32b1e5493b9fd98734daeba93cdeea0f66fd12039fb69bbc'
	'f7394926b8f8034b45363dc36c5b6e61d9896ae6bdac336bdfdc525df6c161bd95b55bb73ddc483b83900eb748b47336f1d1e2ccc20a6722d8f5c20fa2a65abc'
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

# Maintainer: Microoo <hu@microoo.net>
pkgname=substratumnode-cli-git
pkgver=0.4.1.r0.gbb7f3a4
pkgrel=1
pkgdesc="Command line binary of SubstratumNode. SubstratumNode is the foundation of the decentralized SubstratumNetwork. SubstratumNodes work together to relay CORES packages and content on the network."
arch=('x86_64')
url="https://github.com/SubstratumNetwork/SubstratumNode"
license=('GPLv3')
depends=('rust' 'openssl')
conflicts=('substratumnode-cli')
provides=('substratumnode-cli')
options=('!strip' '!emptydirs')
source=("${pkgname}::git://github.com/SubstratumNetwork/SubstratumNode")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/${pkgname}"
    
    # remove sign & node_ui
    sed -i '/# sign/,$d' ci/release.sh
    
    # build
    ci/release.sh
}

package(){
    install -Dm755 "$srcdir/${pkgname}/node/target/release/SubstratumNode" "$pkgdir/usr/bin/SubstratumNode"
    install -Dm755 "$srcdir/${pkgname}/dns_utility/target/release/dns_utility" "$pkgdir/usr/bin/dns_utility"
}

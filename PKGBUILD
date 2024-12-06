# Maintainer: timttmy <marshall at brooklandsand dot co dot uk>
pkgname=pidgin-meshtastic-git
pkgver=16.686cec6
pkgrel=1
PLUGIN_DIR=/usr/lib/pidgin/
DATA_DIR=/usr/share

pkgdesc="A Meshtastic plugin for Pidgin."
arch=('any')
url="https://github.com/dadecoza/pidgin-meshtastic"
license=('MIT')
depends=('pidgin')
makedepends=('git' 'make')
options=("!strip")
source=("git+${url}.git"
        "git+https://github.com/nanopb/nanopb.git")
        
sha256sums=('SKIP'
            'SKIP')

pkgver() {
	cd "${srcdir}/pidgin-meshtastic"
	printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${srcdir}/pidgin-meshtastic"
	git submodule init
	git config submodule."lib/nanopb".url      "${srcdir}/nanopb"

	git -c protocol.file.allow=always submodule update
}

build() {
	cd "${srcdir}/pidgin-meshtastic"
	make
}

package() {
    cd "$srcdir/pidgin-meshtastic"
    
    install -d "$pkgdir/$PLUGIN_DIR"
	install -m 644 libmeshtastic.so "$pkgdir/$PLUGIN_DIR"
	install -d "$pkgdir/$DATA_DIR"/pixmaps/pidgin/emblems/16
	install -m 644 pixmaps/pidgin/emblems/16/meshtastic-signal-0.png "$pkgdir/$DATA_DIR"/pixmaps/pidgin/emblems/16
	install -m 644 pixmaps/pidgin/emblems/16/meshtastic-signal-1.png "$pkgdir/$DATA_DIR"/pixmaps/pidgin/emblems/16
	install -m 644 pixmaps/pidgin/emblems/16/meshtastic-signal-2.png "$pkgdir/$DATA_DIR"/pixmaps/pidgin/emblems/16
	install -m 644 pixmaps/pidgin/emblems/16/meshtastic-signal-3.png "$pkgdir/$DATA_DIR"/pixmaps/pidgin/emblems/16
	install -m 644 pixmaps/pidgin/emblems/16/meshtastic-signal-4.png "$pkgdir/$DATA_DIR"/pixmaps/pidgin/emblems/16
	install -d "$pkgdir/$DATA_DIR"/pixmaps/pidgin/protocols/16
	install -m 644 pixmaps/pidgin/protocols/16/meshtastic.png "$pkgdir/$DATA_DIR"/pixmaps/pidgin/protocols/16/meshtastic.png
	install -d "$pkgdir/$DATA_DIR"/pixmaps/pidgin/protocols/22
	install -m 644 pixmaps/pidgin/protocols/22/meshtastic.png "$pkgdir/$DATA_DIR"/pixmaps/pidgin/protocols/22/meshtastic.png
	install -d "$pkgdir/$DATA_DIR"/pixmaps/pidgin/protocols/48
	install -m 644 pixmaps/pidgin/protocols/48/meshtastic.png "$pkgdir/$DATA_DIR"/pixmaps/pidgin/protocols/48/meshtastic.png
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

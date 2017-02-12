# Maintainer: spider-mario <spidermario@free.fr>
pkgname=mini-audicle
pkgver=1.3.3
pkgrel=2
pkgdesc='Integrated Development + Performance Environment for ChucK'
arch=('i686' 'x86_64')
url="http://audicle.cs.princeton.edu/mini/"
license=('GPL')
groups=('multimedia')
depends=('qscintilla-qt4' 'libsndfile'
# Uncomment one of the following three lines depending on the backend that you
# want. Also uncomment the corresponding make target in build() below.
# Default: PulseAudio
         'libpulse'
#        'alsa-lib'
#        'jack'
)
optdepends=('chuck: for documentation and command line interface')
source=("http://audicle.cs.princeton.edu/mini/release/files/miniAudicle-$pkgver.tgz"
        'miniAudicle.desktop')
sha512sums=('fb07741073638cd7d8557b3b1ffe0aa2eca81b13e375999ddb6db88aa5c9b47c70784945758fbef72a494b8af65ca8f3a19aef9320eb300374a467ada76217b5'
            'ebf6d4e8dc18078dbe22db8d56cafe1664e12ab3a37d994c4aa51502c9c6688ad9fb25a06a0d4e8cb4db06348eccda2b28f204589aea7ddceed51269f6325e7d')

prepare() {
	cd "miniAudicle-$pkgver"/src
	sed -e '/GIT_REVISION/,+2 d' -i miniAudicle.pro
}

build() {
	cd "miniAudicle-$pkgver"/src
	make \
		linux-pulse
#		linux-alsa
#		linux-jack
}

package() {
	install -Dm644 miniAudicle.desktop "$pkgdir"/usr/share/applications/miniAudicle.desktop

	cd "miniAudicle-$pkgver"/src
	install -Dm755 miniAudicle "$pkgdir"/usr/bin/miniAudicle
	install -Dm644 qt/icon/miniAudicle.png "$pkgdir"/usr/share/pixmaps/miniAudicle.png
}

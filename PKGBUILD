# Maintainer: spider-mario <spidermario@free.fr>
pkgname=mini-audicle
pkgver=1.3.5.2
pkgrel=1
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
sha512sums=('888771609cda50c873efe27dd94d9f10ea0f2904f14300baa4bc485b427814f0cfdcf214f8b2c8a17857dd64549397bfa3aa18d3053b74e3095594aa4d433084'
            'ac5fa241ab3651f985f0cc9a1c50fee72ee1aa731dd7330824c8f98c77d6d0f12a62aa43fede2930720657b9a526659139c954eaa76a38a19b9b6848aec6318e')

prepare() {
	cd "miniAudicle-$pkgver"/src
	sed -e '/GIT_REVISION/,+2 d' -i miniAudicle.pro
	perl -pe 's/(?<=-lqscintilla2)\b/_qt4/' -i miniAudicle.pro
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

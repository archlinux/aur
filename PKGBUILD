# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Contributor: WB2FKO <mph at sportscliche dot com>
# Original Submission: Bob Finch <w9ya@qrparci.net>

pkgname=ebook2cw
pkgver=0.8.4
pkgrel=1
pkgdesc="Converts plain text files to Morse Code formatted as MP3 or OGG"
arch=('i686' 'x86_64')
url="http://fkurz.net/ham/ebook2cw.html"
license=('GPL')
depends=('lame' 'libvorbis')
optdepends=('mpg123: for CLI playback/testing')
source=(http://fkurz.net/ham/$pkgname/${pkgname}-${pkgver}.tar.gz
	http://fkurz.net/ham/$pkgname/example/Example.txt
	http://fkurz.net/ham/$pkgname/example/Chapter{00,01,02}.mp3)

prepare() {
	cd $srcdir/$pkgname-$pkgver
	sed -i s:'#iso':'iso': ebook2cw.conf	
	sed -i s:'#utf':'utf': ebook2cw.conf
}

build() {
	cd $srcdir/$pkgname-$pkgver
#	make USE_OGG=NO all # <- USE *if* you do not want ogg capability
	make all
}

package() {
	cd $srcdir/$pkgname-$pkgver

	mkdir -p $pkgdir/usr/share/locale/de/LC_MESSAGES
	make DESTDIR="${pkgdir}/usr" install

	mkdir -p $pkgdir/usr/share/$pkgname
	install -m644 ../Example.txt $pkgdir/usr/share/$pkgname
	install -m644 ../*.mp3 $pkgdir/usr/share/$pkgname
}
md5sums=('47d8871099b4813b491d30d15d3983d9'
         '426e3b5ee86806cefbe2a499b4fd35b9'
         '52c6884888810f6b7199f004c38608a9'
         '4396acf1065cc198bdc545ae83968b19'
         'd0aa612cdfd651ce03bfead58319b7ed')
sha256sums=('85375359f7e870fb7965591aa7c1a854767acf18e3c768554c0f0fe811ebe990'
            '8032dd47c1efbef8f02e3fb421e0c172f7165b7c23b856228c4632a6296d5f26'
            'fee8e860f8cea4c5504beb02d12d41795a039e27eb32aab0dd297a37e3ad3103'
            '38a6bee36cf76b9280b66f871a2edd565192b13604b0ed316317027cf9175243'
            '205c95d4b03aca0b9c78681bfe3fcd31354e010076775252851bcc81282e8acb')

# Maintainer: Uwe Koloska <kolewu [at] koloro [dot] de>
# Contributor: Christoph Drexler <chrdr [at] gmx [dot] at>

pkgname=wavesurfer
pkgver=1.8.8p5
pkgrel=4
pkgdesc="Open source tool for sound visualization and manipulation"
arch=('any')
url="http://sourceforge.net/projects/wavesurfer/"
license=('custom')
depends=('tcl>=8.4' 'tk>=8.4' 'snack>=2.2')
source=("http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver-src.tgz"
  wavesurfer
  wavesurfer.desktop
  prefs.patch
  fix-wavebar.patch
  snack-callbacks.patch
  fix-defaultconfig-search.patch
  fix-tkcon.patch)
sha256sums=('ae56061147dd1170f7485dc9c19db7a45dd157050ac3946662c7fc79cffb611a'
            '6fd71453d7d29828ccf7062001679b24899b8866fbfdc2eecb5c0e71d25ed885'
            '99caf2c9150cd27dc00dfe05403d2ca0d2d0ef9364b43b53a904508911d8e941'
            '83a952e3d10f24d078db295ac0716601bc9da54aafff697dd539f35823721985'
            '974c027de15de7848843c4e35adc1c7c9e23f147457e10f0a8df19b3bf182f68'
            'f476146ab13b535c16a48e5a82e3b99377deba9dcef0c40bfd15660be674b1b8'
            '08263324c0af3f82b3f3868068b268dd873a2338bb884756213781271bc11cb2'
            'd15323cc7d96a6ed34a30484e6345898bff70c8180f0ae7c9ef1effdea73ace5')

build() {
  cd $pkgname-$pkgver

  patch -p0 -i ../prefs.patch
  patch -p0 -i ../fix-wavebar.patch
  # if you have a snack version that is compatible with tcl 8.6
  # you should leave out the following patch
  patch -p0 -i ../snack-callbacks.patch
  patch -p0 -i ../fix-defaultconfig-search.patch
  patch -p0 -i ../fix-tkcon.patch
}

package() {
	mkdir -p $pkgdir/usr/bin/
	mkdir -p $pkgdir/usr/{lib,share/{doc,licenses}}/wavesurfer/
	cp -r $srcdir/$pkgname-$pkgver/{demos,icons,msgs,src,tools} $pkgdir/usr/lib/wavesurfer/
	chmod a+x $pkgdir/usr/lib/wavesurfer/src/app-wavesurfer/wavesurfer.tcl
	cp $srcdir/$pkgname-$pkgver/doc/* $pkgdir/usr/share/doc/wavesurfer/
	install -Dm755 $srcdir/wavesurfer $pkgdir/usr/bin/wavesurfer
	install -Dm644 $srcdir/wavesurfer.desktop $pkgdir/usr/share/applications/wavesurfer.desktop
	install $srcdir/$pkgname-$pkgver/LICENSE.txt $pkgdir/usr/share/licenses/wavesurfer/LICENSE.txt
}

# Maintainer: Mathias Buhr <napcode@aparatus.de>
# Contributor: Christopher Arndt <osam -at- chrisarndt -dot- de>
# Contributor: redtide <redtid3@gmail.com>

_pkgname=ConvertWithMoss
pkgname=${_pkgname,,}
pkgver=6.0.0
pkgrel=1
pkgdesc="A tool for converting multi-sample from one format to another."
url="https://mossgrabers.de/Software/ConvertWithMoss/ConvertWithMoss.html"
arch=(any)
license=(LGPL3)
depends=(
  'java-runtime>=16'
  'java-openjfx'
)
makedepends=(maven)
source=(
  $pkgname-$pkgver.tar.gz::https://github.com/git-moss/ConvertWithMoss/archive/refs/tags/$pkgver.tar.gz
  convertwithmoss.png
  convertwithmoss.sh
  de.mossgrabers.ConvertWithMoss.appdata.xml
  de.mossgrabers.ConvertWithMoss.desktop
)
sha512sums=(
  'fe1b1c5b86584b99ca9df4ae0488ea428621d27a179afbb548d0951c16b47e68f39780739b617293c3682eb7c92eec785f0a9bc62606b6660991a628812d7709'
  '66e6a1c66f170186825d52a92706b6681321732232455398352e64a8ef2e26f164b9b6dcfaa7dd9aef6f8796be9bd4f5933706afdc1b32c607c034916823418e'
  '6f5d1c5ebd37efd092bd8057b7e19d77be6176a3704795ee9bb3efe2557711afa3442f5e5fa28d1c6e305f1e42fe5efc2781a2301de09115b7e8393e9efd2577'
  '4d734b40bd2348c9edf199d40a85bfb53e717c407d851a391083f7f08923ffbc03cf6601042d6cfac9f2b08c88b9668efa518f06537f7860099c7c686b10185b'
  'e6dbbb8c29ec86719806bf6ca45f24e99df0a6fa18b735617d00f21141212045f43246feb6bc075e2db6a577ed0091f8a464ca9ae1de33864135f6e85897dfb3'
)
# NOTE: For the next versions:
# The included files were added upstream, so uncomment the following commented
# lines and remove all the rest after them in both build and package functions

build() {
  cd "$_pkgname-$pkgver"
  export MAVEN_OPTS=-Dmaven.repo.local="$srcdir/repository"
# make

  mvn package
}

package() {
  cd "$_pkgname-$pkgver"
  export MAVEN_OPTS=-Dmaven.repo.local="$srcdir/repository"
# DESTDIR="${pkgdir}/" PREFIX=/usr make install

  install -dm755 "$pkgdir"/usr/share/$_pkgname
  cp target/lib/$pkgname*.jar "$pkgdir"/usr/share/$_pkgname/$pkgname.jar
  cp target/lib/*-linux.jar "$pkgdir"/usr/share/$_pkgname/
  cp target/lib/uitools-*.jar "$pkgdir"/usr/share/$_pkgname/
  install -Dm644 "$srcdir"/de.mossgrabers.ConvertWithMoss.desktop -t "$pkgdir"/usr/share/applications/
  install -Dm644 "$srcdir"/de.mossgrabers.ConvertWithMoss.appdata.xml -t "$pkgdir"/usr/share/metainfo/
  install -Dm644 "$srcdir"/$pkgname.png -t "$pkgdir"/usr/share/pixmaps/
  install -Dm755 "$srcdir"/$pkgname.sh "$pkgdir"/usr/bin/$pkgname
}

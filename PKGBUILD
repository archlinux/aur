# Contributor: Star Brilliant <echo bTEzMjUzQGhvdG1haWwuY29tCg== | base64 -d>

pkgname=isse
pkgver=0.2.0
pkgrel=1
pkgdesc="An Interactive Source Separation Editor"
url="http://isse.sourceforge.net/"
arch=('x86_64' 'i686')
license=('GPLv3')
makedepends=('git')
depends=('fftw' 'jack')
source=("isse-code::git://git.code.sf.net/p/isse/code#commit=451aa4e3522a37e9057e972bdcf18b458e891340"
        "eigen::git://github.com/RLovelett/eigen.git#commit=4f8510325e951490df3249205ae8b69b7faed07f"
        "juce::git://github.com/julianstorer/JUCE.git#commit=79d60f0b3523bac78822b805ff463cbd5db1cd2a")
md5sums=('SKIP' 'SKIP' 'SKIP')

if [ "$CARCH" == "x86_64" ]
then
  TARGET_ARCH=-m64
else
  TARGET_ARCH=-m32
fi

prepare() {
  cd "$srcdir/isse-code"
  rmdir sdks/juce sdks/eigen
  ln -s "$srcdir/juce" sdks/juce
  ln -s "$srcdir/eigen" sdks/eigen
}

build() {
  cd "$srcdir/isse-code/builds/Linux"
  CONFIG=Release TARGET_ARCH="$TARGET_ARCH" make
}

package() {
  cd "$srcdir/isse-code/builds/Linux/build"
  install -Dm755 ISSE "$pkgdir/usr/bin/ISSE"
  ln -s /usr/bin/ISSE "$pkgdir/usr/bin/isse"
}

# vim:set ts=2 sw=2 et:

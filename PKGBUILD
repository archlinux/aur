# Maintainer: Thomas Weißschuh <thomas t-8ch de>

pkgname=smlnj
pkgver=110.79
pkgrel=1
pkgdesc="Standard ML of New Jersey, a compiler for the Standard ML '97 programming language"
url="http://www.smlnj.org/"
license=(BSD)
arch=(i686 x86_64)
provides=(sml)

depends_x86_64+=('lib32-glibc')
makedepends_x86_64+=('gcc-multilib')

_url="http://smlnj.cs.uchicago.edu/dist/working/${pkgver}/"

source=(
  "urlgetter.sh"
  "profile.d-smlnj.sh"

  "smlnj-${pkgver}-boot.x86-unix.tgz::${_url}boot.x86-unix.tgz"

  "smlnj-${pkgver}-config.tgz::${_url}config.tgz"

  "smlnj-${pkgver}-cm.tgz::${_url}cm.tgz"
  "smlnj-${pkgver}-compiler.tgz::${_url}compiler.tgz"
  "smlnj-${pkgver}-runtime.tgz::${_url}runtime.tgz"
  "smlnj-${pkgver}-system.tgz::${_url}system.tgz"
  "smlnj-${pkgver}-MLRISC.tgz::${_url}MLRISC.tgz"
  "smlnj-${pkgver}-smlnj-lib.tgz::${_url}smlnj-lib.tgz"

  "smlnj-${pkgver}-ckit.tgz::${_url}ckit.tgz"
  "smlnj-${pkgver}-nlffi.tgz::${_url}nlffi.tgz"

  "smlnj-${pkgver}-cml.tgz::${_url}cml.tgz"

  "smlnj-${pkgver}-ml-lpt.tgz::${_url}ml-lpt.tgz"
  "smlnj-${pkgver}-ml-lex.tgz::${_url}ml-lex.tgz"
  "smlnj-${pkgver}-ml-yacc.tgz::${_url}ml-yacc.tgz"
  "smlnj-${pkgver}-ml-burg.tgz::${_url}ml-burg.tgz"

  "smlnj-${pkgver}-trace-debug-profile.tgz::${_url}trace-debug-profile.tgz"
)

_unused=(
  "smlnj-${pkgver}-eXene.tgz::${_url}eXene.tgz"

  "smlnj-${pkgver}-pgraph.tgz::${_url}pgraph.tgz"
  "smlnj-${pkgver}-heap2asm.gz::${_url}heap.asm.tgz"
)

build() {

  cd "$srcdir"

  # The build system uses this env variable
  URLGETTER="$srcdir/urlgetter.sh"

  # urlgetter.sh uses these variables
  export srcdir
  export pkgver

  # Parallel builds won't work
  unset MAKEFLAGS

  # Confuses install.sh
  unset SMLNJ_HOME

  INSTALLDIR="$srcdir/install"
  mkdir $INSTALLDIR
  export INSTALLDIR

  config/install.sh
}

package() {

  cd "$srcdir"

  mkdir -p "$pkgdir/usr/lib/smlnj"
  cp -R "$srcdir/install/"{bin,lib} "$pkgdir/usr/lib/smlnj"

  mkdir -p "$pkgdir/etc/profile.d"
  cp "$srcdir/profile.d-smlnj.sh" "$pkgdir/etc/profile.d/smlnj.sh"

  mkdir -p "$pkgdir/usr/share/"
  cp -R "$srcdir/doc/man" "$pkgdir/usr/share/"
  find "$pkgdir/usr/share/man" -name '._*' -delete
}

sha256sums=('4da78effe7d3644c28c731c8e4003a9cecec9f8f61d2fa4553981a729f2d200b'
            'dd20a81a5d2899f60183215ab6a412d522d2c6801d454c142225716899e089f3'
            'f8a3cc665503400cf9941b4475ccfd485c157bdc25fb45b8ce34423a61236a5a'
            'ab2302580e187f6ec1ab54355260b8b614fb8c94ff68847c5b40fcae8b872aea'
            'bf558d31be2935f974cad65e25d7b2dc1320cb1d7dd5f0726d8e87b961388f9c'
            'bc127b1d6b5af3802d43c0ca741a24a81c98ffff6f9cb948f57548f84e8a3c00'
            '208f40f720873af65067d48a6757594b3f300918951be77dfb6dd922de6f5b51'
            '712a87f7409103d89f2afcd1dc55e7f71d5f55d7a0493543b96054644b254302'
            'e8e828fc8056a60ea470486635c2da3329f0104e3559693eb2c42fe7cf7d03a7'
            '09444d739f15323b4039617b38968fd494aba948b0c5b9a9600126f88760333b'
            'fc1e3d9a137dfd81df5122e2b64f6f64cdae88c6d0c16e246ad82b8e6f711dfd'
            'db24b637847bd6052e822fafb370bf545b09c0a15078c78169a0f946e3a98494'
            'e2f49aac1eebdac7ce206dec28dc4dd347f203e752808279347069fa8bc17485'
            'f5f08bc46e83d4ca825e1b921630b1855f51bbe4bada5d7d48d58fe3c43e1a85'
            'cb98d2f221bfba16d852ebed73c0540395fa240034d35543b046a22d428ec551'
            'f3c04f458024be9d832906bbd4143a59a7e3b50d66cb7488ebb3f380d772b136'
            '2d408316bf26e98e5df9a37e84a018db07149c7a7287e894ba33ccf8150abfac'
            '3c6a87fd658a79f722bb510f834545157b13a46a16e9c78667d7312f36a3914b')

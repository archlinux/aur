# Maintainer: Thomas Weißschuh <thomas t-8ch de>

pkgname=smlnj
pkgver=110.78
pkgrel=5
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
  "linux-4.0.patch"

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

prepare() {
	cd "$srcdir"
	patch -p0 < "$srcdir/linux-4.0.patch"
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
            'a3401d851392cc62fbd7206549ec9ed5969da7025b0fe016cfbd77514fa398a2'
            'aad8994871dd9e4669ed8f4af3e35ed61f34763f1933839bedb65132c7118da7'
            'e2dd00b39b00ad892f182ce3f824d1540b0e350f2aee748ca971d44b5d340c05'
            '1d8911cf0b3b93dd5d62334d7be090497b88d87e8924623fc36311498d3ca345'
            'e2dd6a1bdd5953958262fcbf385633611ff169dc4c272a568f3551c43e4d49d4'
            '5e9f750991f43ce6bd57f1877c579ea778f24d612974260c27bf216857d88bdf'
            '49311750b735357c59d30c4bf79d2b4bdbe2426319bdd196b5ac4bc647a5b1c9'
            '1bf07d6cf2307b69e68a87be1880ae1a9d79a0c76fc980c715869186e7e47845'
            '590e261b94140d4d4091c93b61d077995925dd98148e9d31e680f781d1e5b6d3'
            'd7f2f5866cc226fd1232f568c62b0d691d57cb0388b4e2e26480f82e37201cdb'
            '008edc563f192194c4eec7a3f9ecd97ddac6363bf070ea84f25c8ce5620f7ab2'
            '1fbe7370fde5b7f222fab9246b35773f24778edd9d91145b82563fa5b791ca61'
            '38b6766f4112670440417005db2cd76a3ccf38014aeba129a491371c687b6209'
            'e5f756524e2d5ed1b0580d843ae59dcb1d71c5e671bcc07d7df83a5e5a6b3a50'
            'a646e783ffff2b566e4013944c01cbcfbb6fad346d552fe5ea7a90d53c48c752'
            '22b971dffe3e14ee69fef30ddc3c4d50fef43a4c8874a86abeeecdf684f7560d'
            '93c22700a52fe99fce363fcd52f22f0161f591b84cba360bba7ac8b7c7d39a2b')

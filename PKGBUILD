# Maintainer: Thomas Weißschuh <thomas t-8ch de>

pkgname=smlnj
pkgver=110.80
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
            'e4e0def3d38816eab5ce3d50b0c6d732779ff83ef65d2aef34b7c69d780a3488'
            'fd2120ebae607b71778914700385a70b38596e13c350e489c483058693217b03'
            'ae892f431c6c570e52603c3297b829a81cd0e126c3793a484eaf37966c52820c'
            'f1855a1070793cd4474af2752a816d72227994233a000877c27b2c4269a60d6e'
            '6e13a544bd346e6b4103d51300290eb2f056983c903aa658db3b1489a8ab9d45'
            'dc2198c9c423af9c5f3d65da7166ba690e1672291a247cd1e6ba9e8419eaf1a8'
            '425a4b648e0f5d0cf660e5a325756cf6f373daacf8261d8c424d163d277fd9f0'
            'a8c3aca6a638fff540055791236f5bc30e7d8044782d220beddd711eaa7ea352'
            '7fe672bbdb917aca5825246658b692b63f7f66a15afefeb707baf914263187ba'
            '4d1b048b4bced62820dba17b92e0276d34336f98f298aa77240da6d8fed5a128'
            '23ae9fcf214636301941119b46b044f61f1d2f4b6f337b2fe72213e18a7a489a'
            '3d73a4c0d68694adeec6111f10a94386204db51fc86814669c364802776b0c79'
            '441c2895b0cf592a207a5bc13ec5625f3463b32c7b7f7cd717f16ce587073102'
            '64c7acaa07e664f7751e46da1d6c9c1d3a080f70b28fcf611e05fd96e1382ca1'
            'fcade4c8518621099022bc28d4795e6ae972f8b3b64b01fb14778a714bfe44db'
            'd1148cddbff76e38a96d2db95edb33b5b81e603ce8e2d4e8d3b4b54040db934a')

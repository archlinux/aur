# Maintainer: Curve <curve.platin at gmail.com>
pkgname=cheerp-bin
_pkgname=cheerp

pkgver=3.0
pkgrel=1

license=('LLVM')
url="https://docs.leaningtech.com/cheerp/"
pkgdesc="Cheerp is an open-source, permissively licensed, enterprise-grade C/C++ compiler for Web applications"

provides=("$_pkgname")
conflicts=("$_pkgname")
makedepends=("binutils" "tar" "grep" "coreutils")

arch=('x86_64')

source=(
  'https://launchpad.net/~leaningtech-dev/+archive/ubuntu/cheerp-ppa/+files/cheerp-core_3.0-4~kinetic_amd64.deb'
  'https://launchpad.net/~leaningtech-dev/+archive/ubuntu/cheerp-ppa/+files/cheerp-libcxx-libcxxabi_3.0-1~kinetic_arm64.deb'
  'https://launchpad.net/~leaningtech-dev/+archive/ubuntu/cheerp-ppa/+files/cheerp-libs_3.0-1~kinetic_amd64.deb'
  'https://launchpad.net/~leaningtech-dev/+archive/ubuntu/cheerp-ppa/+files/cheerp-llvm-clang_3.0-2~kinetic_amd64.deb'
  'https://launchpad.net/~leaningtech-dev/+archive/ubuntu/cheerp-ppa/+files/cheerp-musl_3.0-1~kinetic_amd64.deb'
  'https://launchpad.net/~leaningtech-dev/+archive/ubuntu/cheerp-ppa/+files/cheerp-utils_3.0-1~kinetic_amd64.deb'
)

noextract=("${source[@]##*/}")

sha256sums=(
  '27321654bdec641af6a3a378e05f7c1b5f6e43a6ea1fb13e94c4522c49c329a2'
  '674fcc7f528b5837b385056133472a277a4ad658d13c7d4d76bc091306aaffcd'
  '7833aefc22cf355dc118a75d8eeb772331f1641b743568dcc44de1c89523b1a0'
  '4fb75c4a0b018995c5b13c87fc5e622aa5db3be0f1d11ba3e80bd45c3d1463f6'
  'fc137a3de8ddb184ad1e42d44657ff6f0a509ac6f110b90ba8cc1040bbdb0952'
  '39f35a1713a379c46b7641052f2746c1f27df8ed4ecade2c999965dc560ecd11'
)

prepare() {
  echo "prepare"
}

unpack() {
  ar x $1
  tar xvf data.tar.zst
}

package() {
  # Unpack
  
  for f in $(ls | grep '.deb'); do
    unpack $f
  done

  # Install files
  
  cp -p -r "${srcdir}/usr" "${pkgdir}/"
  cp -p -r "${srcdir}/opt" "${pkgdir}/"
}

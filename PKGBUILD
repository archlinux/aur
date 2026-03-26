# Maintainer: Michal Lurie <Michal.Lurie@gmail.com>

pkgname=incplot
pkgver=1.0.1
pkgrel=1
pkgdesc='CLI tool for drawing great looking plots in the terminal and in HTML focused on user ergonomics and simplicity'
arch=(x86_64)
url=https://github.com/InCom-0/incplot
license=('MIT')
depends=(
  harfbuzz
  sqlite
  libarchive
  fontconfig
  woff2
  xxhash
  zlib
  cpr
)
makedepends=(
  cmake
  git
  ninja
  'argparse>=3.2'
  'indicators>=2.3'
  'magic_enum>=0.9.7'
  nlohmann-json
  unordered_dense-git
)
source=(
  "git+https://github.com/InCom-0/incplot.git#tag=5d673e8c5624a8e08c691dbb0064bb7122dac275"

  "git+https://github.com/InCom-0/incplot-lib.git#tag=31c11b3e85d3720c03691b7737d9f75cee303815"
  "git+https://github.com/InCom-0/incstd.git#tag=815a2a38d23441f9de1015b79b5e3c05bafbb157"
  "git+https://github.com/MiSo1289/more_concepts.git#tag=ea5b6815f5929cdb086f76d43f3e9b122bbcaaeb"
  "git+https://github.com/InCom-0/incerr.git#tag=e58ddf602e1f475e6da86c3795d194c1e47abfdf"

  "git+https://github.com/InCom-0/otfccxx.git#tag=c3de0e3da29e9fff336e824063dd146b644475a7"
  "git+https://github.com/InCom-0/ots_cmake.git#tag=74becafededb6a520328dff82c16f75f0fdb7a2d"
  "git+https://github.com/InCom-0/incfontdisc.git#tag=d13c483be49fcabb5a7650e32d699ef041b6092c"

  "git+https://github.com/InCom-0/libarchive_superbuild.git#tag=97a5dd7312f03f6d5b1d3877e1de02b8cd112a72"
  "git+https://github.com/rbock/sqlpp23.git#tag=98924536db64b7bfc3a138f6ecf9bd47f60c81da"
)
sha512sums=('462be32ec2867eb925f8b441e30b53d8be139017f0824a8be36aab017f2464a806dca01fce115487d168555a338977ac4e1580be6743c7940c07752f63e517e4'
            'ef49e4b697ea48621d4c319c8269bfc9ce539f15a3082bfca09fadc7cb4d277c29dc5507959e56f40855fc35cf2f8af07b905f81236b6f5b551289f13670822d'
            'd102d0b202aaaa147e32c3e97f8224c0c201a3d8fa22697d42853070b3d395366d445ee4e57b8e282cffbcdcf2db85dccfe709c44e61ce01c1e87ff89b43b303'
            '6357132ee4eafbd34715008c05ed76f25166b114cf34688188294519c3eafb6075ab10682c89dc8ad4cc6d3d4d7a329f5c20463eee1eab8ef26c9e4b4f01ec20'
            '858578d7163f47d13cb4c015a584b670b6cfaee0b3522278f4d8b7b88d893a924628f61ea2e0964fc3f1314e980c8ef27ec7f890751df4b413393bbfa05e5189'
            '9ed4089641ee3959a2511f9059a0908ad70fc0d95d6882c6e30785446167aec8de235a9bac231a4b4e59f60c8e876bceb43283a1f5cffbf2990333663c1f7b33'
            '79b4a4e55bce1ac0c6cc8a7f793b440d22d430740a7ededb9c325a70d5391de1e0015d932eee72d89dc7a20bb1b76de57f2c4bd480fd5dfe10a73cbf850890b8'
            '45491f4fef8bcb97bfca4bb6611051546952df7cdb6c4163daeaf52078a3f60e16644e75598d1845bf87af39ca91d620519f336cad0bdacf42c6c645f100ec5f'
            '50caa7d55c44ce94c3518a5184d58ebbfa7d6ce798aa2db3187855e742f46419c2d9b07da89f3ed80022527c5814b0f153c4054dce420c25d06cc99ae989ff17'
            'cc82e2965896f0b6ffb7d0acdcfc7c1382648a8318a11f3eab3314e9c4c964508af09edcb22bfcdd38c633531b5b272d67bd455482e7128c431fee63a469340e'
)

build() {
  local cmake_options=(
    --preset gcc_Release
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_PREFIX=/usr
    -D CPM_LOCAL_PACKAGES_ONLY=ON
    -D CPM_incplot-lib_SOURCE="$srcdir/incplot-lib"
    -D CPM_incstd_SOURCE="$srcdir/incstd"
    -D CPM_more_concepts_SOURCE="$srcdir/more_concepts"
    -D CPM_incerr_SOURCE="$srcdir/incerr"
    -D CPM_otfccxx_SOURCE="$srcdir/otfccxx"
    -D CPM_ots_SOURCE="$srcdir/ots_cmake"
    -D CPM_incfontdisc_SOURCE="$srcdir/incfontdisc"
    -D CPM_libarchive_superbuild_SOURCE="$srcdir/libarchive_superbuild"
    -D CPM_sqlpp23_SOURCE="$srcdir/sqlpp23"
    -W no-dev
  )

  cd ${pkgname}
  cmake "${cmake_options[@]}"
  cmake --build build
}

check() {
  cd ${pkgname}
  ./build/stage/bin/incplot --version
}

package() {
  cd ${pkgname}
  DESTDIR="$pkgdir" cmake --install build
}
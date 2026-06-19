# Maintainer: Michal Lurie <Michal.Lurie@gmail.com>

pkgname=incplot
pkgver=1.0.3
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
  "git+https://github.com/InCom-0/incplot.git#tag=37526a8d84d5f4d477f491912e7b11293320502e"

  "git+https://github.com/InCom-0/incplot-lib.git#tag=70194188fe28a34f9fcab8ee9ea670dfbe2d3f9a"
  "git+https://github.com/InCom-0/incstd.git#tag=e0c58c33af096987c4ccd1d9c7a7738793dca9e7"
  "git+https://github.com/MiSo1289/more_concepts.git#tag=ea5b6815f5929cdb086f76d43f3e9b122bbcaaeb"
  "git+https://github.com/InCom-0/incerr.git#tag=e58ddf602e1f475e6da86c3795d194c1e47abfdf"

  "git+https://github.com/InCom-0/otfccxx.git#tag=7840f7d85f00aea7290a0dee6dfbf72787aa66d9"
  "git+https://github.com/InCom-0/ots_cmake.git#tag=a37191d71e3ad829ec4a8c3eedf344da0c317962"
  "git+https://github.com/InCom-0/incfontdisc.git#tag=d13c483be49fcabb5a7650e32d699ef041b6092c"

  "git+https://github.com/InCom-0/libarchive_superbuild.git#tag=97a5dd7312f03f6d5b1d3877e1de02b8cd112a72"
  "git+https://github.com/rbock/sqlpp23.git#tag=98924536db64b7bfc3a138f6ecf9bd47f60c81da"
)
sha512sums=('6efeab91c50e50dcfa4db543c13e80e397f61b3363ad1a02bef98714aecfc266d27b4356f6c4dab12ae2efb9f8cbd4c7a6480498f6b282d66b7bb9a10c234ea0'
            '18e07dc59af9bd54d15eee41cb826c5a0f82edfe8fd2e0e19e9ceb389cb470763b0c0d91942fddba51efc3af9941578238bd2af717190f7bd6dfd10659adb11d'
            '8f3bac6c651cecb37e767bcd39e994b52790d2aecae318ed4863802eb049e7ebfe9214eaf2e21332a43d81832eee862ea2b212686cb4478ee4b5cd7068a35806'
            '6357132ee4eafbd34715008c05ed76f25166b114cf34688188294519c3eafb6075ab10682c89dc8ad4cc6d3d4d7a329f5c20463eee1eab8ef26c9e4b4f01ec20'
            '858578d7163f47d13cb4c015a584b670b6cfaee0b3522278f4d8b7b88d893a924628f61ea2e0964fc3f1314e980c8ef27ec7f890751df4b413393bbfa05e5189'
            'be9a4e1b55d0305141e3900fbe5cd0aa40babd277fe3a38681607c171af18c8cb899eeff9286a5b3f4a5fd999efdfdf8beb747d2b7992e018862474acbfa0796'
            '7da939745607565bfdf2b05d8614d5abb8b77ed165e05129f97983ba5651e1b5b956093c427bf325aaa1cdc3ec42d4dfeccfcbd35d14ab85e10e09c12709c3b6'
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
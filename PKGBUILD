# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Elmer Skjødt Henriksen <esh@fjerhammer.dk>
# Contributor: Oleksandr Natalenko <oleksandr@natalenko.name>
# Contributor: bender02 at archlinux dot us

pkgname="aescrypt"
pkgver=4.2.2
pkgrel=1
pkgdesc="A file encryption software that uses the Advanced Encryption (AES) standard"
arch=('i686' 'x86_64')
url="https://www.aescrypt.com"
_url="https://github.com/terrapane"
license=('custom:Commercial')
depends=('gcc-libs' 'glibc')
makedepends=('cmake>=3.21')
_pkgsrc="${pkgname}_cli-${pkgver}"
source=("${_pkgsrc}.tar.gz::${_url}/aescrypt_cli/archive/refs/tags/v${pkgver}.tar.gz"
        # aescrypt_cli
        "aescrypt_engine-4.0.7.tar.gz::${_url}/aescrypt_engine/archive/refs/tags/v4.0.7.tar.gz"
        # "aescrypt_lm-1.0.4.tar.gz::${_url}/aescrypt_lm/archive/refs/tags/v1.0.4.tar.gz"
        "program_options-1.0.1.tar.gz::${_url}/program_options/archive/refs/tags/v1.0.1.tar.gz"
        "conio-1.0.1.tar.gz::${_url}/conio/archive/refs/tags/v1.0.1.tar.gz"
        "logger-1.0.2.tar.gz::${_url}/logger/archive/refs/tags/v1.0.2.tar.gz"
        "secutil-1.0.3.tar.gz::${_url}/secutil/archive/refs/tags/v1.0.3.tar.gz"
        "random-1.0.1.tar.gz::${_url}/random/archive/refs/tags/v1.0.1.tar.gz"
        "charutil-1.0.2.tar.gz::${_url}/charutil/archive/refs/tags/v1.0.2.tar.gz"
        # aescrypt_engine
        # "stf-1.0.1.tar.gz::${_url}/stf/archive/refs/tags/v1.0.1.tar.gz"
        "libaes-1.0.4.tar.gz::${_url}/libaes/archive/refs/tags/v1.0.4.tar.gz"
        "libhash-1.0.3.tar.gz::${_url}/libhash/archive/refs/tags/v1.0.3.tar.gz"
        "libkdf-1.0.3.tar.gz::${_url}/libkdf/archive/refs/tags/v1.0.3.tar.gz"
        # libaes
        # "stf-1.0.1.tar.gz::${_url}/stf/archive/refs/tags/v1.0.1.tar.gz"
        "bitutil-1.0.1.tar.gz::${_url}/bitutil/archive/refs/tags/v1.0.1.tar.gz")
b2sums=('c6e6591b77f69af4b72460dc246f65e3bc11f72d52eb34c6a49577ed3e6a38c5efcd5cdf00e58c7ac6884e233668bf6e91a2879b5e46a5b7256647d99b68d436'
        '8a861949793d4d099fe7033242db1f340ce14d5dce0945f2018c3eb08be54765e821baa160e4e2b0584286b9bba1e436bcedc05c83bfc544540484ffb48498ae'
        'a992c4f2ecf530b561df99774f58e24a3d8466baed029abb13ff41e8bbaacf630b4516aa24aa99bff340495069372ab3f2a61d83aadec4659c270360c9a248cc'
        'a93f1aad16a3c5bf45c054417524bae0332c672779b6636cf5a2f52fc60de8a4bbf3bac4fba30142b997d6d6fb40556ac08d21f2b78f834602f0773cba48e4a0'
        'ea2a1c945c672473d8d245e51834487ec891d72216d7aab257f7051e2624e0f92b1ad189fc4319d1b90b526408f7aacbc783b8b68b6021b80fa59be03d35961e'
        '6e0babeea88e0b0f48e466ff70652d50c4f4bc37e4cc835e599f40117b2e31b302f8ecb63fda315290151646482869789f612ca0c557503341d0c840b4763d3b'
        '59652e327f63fa318ec179b46781b15d52d4bf46a4c5c159b95e6a9854e4eb11d032636fb111328519f861a92796bcd01bd24e443062416b122ceb4675b8c224'
        '6b3d351ed0330b141a3e7bd5a14fe5e76df4c21bfa7f10a86f913a48f57191456ce4b17f780d0e18e3a928a314e03852e9f4027795f103e041222882216f67f2'
        '072c2dc47d3afe15cd90cd45fdedde1f3572caff34e284f4a34b4a5fb55a943a9fc943bd1a3b5f860d5e434a05eda3df09989dd6679c73dffced05c3481c0670'
        '8cff19cd10c715c6afc61296b1dba1d2306ce1535dd612b6a4984d554221e612b400ee1d4b9b188cac1edbe8fc2cbbcd42e0f8e8147e32e16b033c45a5eb9610'
        '549ed5c7ffd4dcb6ec48b91d1a0bc435802482882e184e2b6a4f60f1e05f26ac0895bf8fc4626a656036426c1a7437e756ade30f8b152cb31faa77d420e56f19'
        '4465eb8c5e11b3edf10e80bee719110216438b32d5936374cc5d7e6cdf0e968e58a8dc8d0bd1b861502513a4f11debfa152426c540b30ca289c261526ef0fd7e')

build() {
  cd "${srcdir}"
  local cmake_options=(
    -G 'Unix Makefiles'
    -B "${_pkgsrc}/build"
    -S "${_pkgsrc}"
    -Wno-dev
    -DCMAKE_BUILD_TYPE:STRING='None'
    -DCMAKE_INSTALL_PREFIX:PATH='/usr'
    -Daescrypt_cli_BUILD_TESTS=ON
    -Daescrypt_ENABLE_LICENSE_MODULE=OFF
    -DFETCHCONTENT_FULLY_DISCONNECTED=ON
    # aescrypt_cli
    -DFETCHCONTENT_SOURCE_DIR_AESCRYPT_ENGINE="${srcdir}/aescrypt_engine-4.0.7"
    # -DFETCHCONTENT_SOURCE_DIR_AESCRYPT_LM="${srcdir}/aescrypt_lm-1.0.4" # private repo
    -DFETCHCONTENT_SOURCE_DIR_PROGRAM_OPTIONS="${srcdir}/program_options-1.0.1"
    -DFETCHCONTENT_SOURCE_DIR_CONIO="${srcdir}/conio-1.0.1"
    -DFETCHCONTENT_SOURCE_DIR_LOGGER="${srcdir}/logger-1.0.2"
    -DFETCHCONTENT_SOURCE_DIR_SECUTIL="${srcdir}/secutil-1.0.3"
    -DFETCHCONTENT_SOURCE_DIR_RANDOM="${srcdir}/random-1.0.1"
    -DFETCHCONTENT_SOURCE_DIR_CHARUTIL="${srcdir}/charutil-1.0.2"
    # aescrypt_engine
    # -DFETCHCONTENT_SOURCE_DIR_STF="${srcdir}/stf-1.0.1" # only needed for tests
    -DFETCHCONTENT_SOURCE_DIR_LIBAES="${srcdir}/libaes-1.0.4"
    -DFETCHCONTENT_SOURCE_DIR_LIBHASH="${srcdir}/libhash-1.0.3"
    -DFETCHCONTENT_SOURCE_DIR_LIBKDF="${srcdir}/libkdf-1.0.3"
    # libaes
    # -DFETCHCONTENT_SOURCE_DIR_STF="${srcdir}/stf-1.0.1" # only needed for tests
    -DFETCHCONTENT_SOURCE_DIR_BITUTIL="${srcdir}/bitutil-1.0.1"
  )
  
  cd "${srcdir}"
  cmake "${cmake_options[@]}"
  cmake --build "${_pkgsrc}/build"
}

check() {
  local excluded_tests=""
  local ctest_flags=(
    --test-dir "${_pkgsrc}/build"
    --output-on-failure
    --parallel $(nproc)
    --exclude-regex "${excluded_tests}"
  )

  cd "${srcdir}"
  ctest "${ctest_flags[@]}"
}

package() {
  cd "${srcdir}"
  DESTDIR="${pkgdir}" cmake --install "${_pkgsrc}/build"

  cd "${_pkgsrc}"
  install -vDm644 "CHANGELOG.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
  install -vDm644 "README.md"    "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE.md"   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}

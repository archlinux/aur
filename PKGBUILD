# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Elmer Skjødt Henriksen <esh@fjerhammer.dk>
# Contributor: Oleksandr Natalenko <oleksandr@natalenko.name>
# Contributor: bender02 at archlinux dot us

pkgname="aescrypt"
pkgver=4.1.2
pkgrel=1
pkgdesc="A file encryption software that uses the Advanced Encryption (AES) standard"
arch=('x86_64' 'i686')
url="https://www.aescrypt.com"
_url="https://github.com/terrapane"
license=('custom:Commercial')
depends=('gcc-libs' 'glibc')
makedepends=('cmake>=3.21')
_pkgsrc="${pkgname}_cli-${pkgver}"
source=("${_pkgsrc}.tar.gz::${_url}/aescrypt_cli/archive/refs/tags/v${pkgver}.tar.gz"
        # aescrypt_cli
        "aescrypt_engine-4.0.4.tar.gz::${_url}/aescrypt_engine/archive/refs/tags/v4.0.4.tar.gz"
        # "aescrypt_lm-1.0.2.tar.gz::${_url}/aescrypt_lm/archive/refs/tags/v1.0.2.tar.gz"
        "program_options-1.0.0.tar.gz::${_url}/program_options/archive/refs/tags/v1.0.0.tar.gz"
        "conio-1.0.0.tar.gz::${_url}/conio/archive/refs/tags/v1.0.0.tar.gz"
        "logger-1.0.1.tar.gz::${_url}/logger/archive/refs/tags/v1.0.1.tar.gz"
        "secutil-1.0.1.tar.gz::${_url}/secutil/archive/refs/tags/v1.0.1.tar.gz"
        "random-1.0.0.tar.gz::${_url}/random/archive/refs/tags/v1.0.0.tar.gz"
        "charutil-1.0.0.tar.gz::${_url}/charutil/archive/refs/tags/v1.0.0.tar.gz"
        # aescrypt_engine
        # "stf-1.0.0.tar.gz::${_url}/stf/archive/refs/tags/v1.0.0.tar.gz"
        "libaes-1.0.1.tar.gz::${_url}/libaes/archive/refs/tags/v1.0.1.tar.gz"
        "charutil-1.0.1.tar.gz::${_url}/charutil/archive/refs/tags/v1.0.1.tar.gz"
        "libhash-1.0.1.tar.gz::${_url}/libhash/archive/refs/tags/v1.0.1.tar.gz"
        "libkdf-1.0.1.tar.gz::${_url}/libkdf/archive/refs/tags/v1.0.1.tar.gz"
        # libaes
        "bitutil-1.0.0.tar.gz::${_url}/bitutil/archive/refs/tags/v1.0.0.tar.gz")
b2sums=('208cdef7dc14e605294c630e18ce9428d25d80bfe704f9351ca381410cb03fe6887e23508376c73e9cf74e0284af7ba5eab5b8fc4e40b833369d80ab35d3cc77'
        '4179d1712d3471942ac11d9a6904d37908a7b9e1909d981db159ae89d3b6e6aa917db3a5b6abd4e5d95cfa1f7d17d3cdd6d4c2f23006a62a472b459dfd18e70a'
        '0316db30907f9898e107f5405fb7682c1d87be1f73eaf87edf319e7bd17a95ec1bc84b0ffcff863da66544adab9bdc29550117959e6b20fb13f0f2dd674af0aa'
        '55f35a304a01e727f247166112d55dc4d939454bb95639686f49c0f165923e1892dc8b26e96077ad9f68231db81c1e65b80c1ecce10b4d01883a36507dc05fa0'
        '05a9ae414511f6e84c0e775e0be3c9b039225a66aa9953b1c7c27a3c75fed7b01c0079f6a08be0fe1a58aaab228f4a0b157863b3e70c2f36fb1d513822fe19d4'
        'dd3575434b8fe25737522e1ff44354013cb39fe88eebcf4d942cbbcaacb53b30a536bc0c6de6d7d91e03cf4c811ca76200e2dc6d93a15a528c05604a9bb18d60'
        'ac0ac6238d2e6c636bf4579a50e258e40ca2856391b87db170730d6c0f0575e622a02ea802281864cfa47fed2ee877c8819969b42c60a199b619ae82f0dc9097'
        '3abfe58ab08ce0d1097d0ad06d0eb03e00400e3d060018af8c8b89e2b4da6aa71ac4b7edc1fb7bd2121830db6b79a26439ae85e2ef6816bef2e88df4ac1a64d1'
        '2ec7fd885598458d6d88a0b2057b5c230a4227b6ac8e99bbd21c138ba0792d71cacbf4264ff130ef83a2c3abe0912f14f4ba9a182136965e24a7de45511615f9'
        '8378ebec1287a00d82100db3874f4b64bb2b29c5fa0aa75b675bd3e18c9affd11c6a1464d3140c4684b6d0effa6e69114902c613fde516bb33eb8b3360b69692'
        'ea4fda5f2fde6198bc65e5675361217523104249599da5911e9cbfd7c4ded0b1a0744d14bfd7e66b72dd97be73be1bda4a2af444286998ce6c8da3ff78e9d419'
        '3663571888a064407d215816020c96a888155098f056ffda5449d917712ea8d00b2c7b174b72d6d9b5420ce9690ac9e8b07c9836e2901fc43f047c058d1d13f3'
        '9c4b81c833cbe78725142b9172025e8f38c64bb822c3c031f699fe716e939fee348fffc4ef6e9ed658ece119b714d840ea54c3a8090a3a53d01b51ff5a3b3100')

build() {
  cd "${srcdir}"
  cmake \
    -G 'Unix Makefiles' \
    -B "${_pkgsrc}/build" \
    -S "${_pkgsrc}" \
    -DCMAKE_BUILD_TYPE:STRING='None' \
    -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
    -Daescrypt_cli_BUILD_TESTS=ON \
    -Daescrypt_ENABLE_LICENSE_MODULE=OFF \
    -DFETCHCONTENT_FULLY_DISCONNECTED=ON \
    -DFETCHCONTENT_SOURCE_DIR_AESCRYPT_ENGINE="${srcdir}/aescrypt_engine-4.0.4" \
    -DFETCHCONTENT_SOURCE_DIR_PROGRAM_OPTIONS="${srcdir}/program_options-1.0.0" \
    -DFETCHCONTENT_SOURCE_DIR_CONIO="${srcdir}/conio-1.0.0" \
    -DFETCHCONTENT_SOURCE_DIR_LOGGER="${srcdir}/logger-1.0.1" \
    -DFETCHCONTENT_SOURCE_DIR_SECUTIL="${srcdir}/secutil-1.0.1" \
    -DFETCHCONTENT_SOURCE_DIR_RANDOM="${srcdir}/random-1.0.0" \
    -DFETCHCONTENT_SOURCE_DIR_CHARUTIL="${srcdir}/charutil-1.0.1" \
    -DFETCHCONTENT_SOURCE_DIR_LIBAES="${srcdir}/libaes-1.0.1" \
    -DFETCHCONTENT_SOURCE_DIR_LIBHASH="${srcdir}/libhash-1.0.1" \
    -DFETCHCONTENT_SOURCE_DIR_LIBKDF="${srcdir}/libkdf-1.0.1" \
    -DFETCHCONTENT_SOURCE_DIR_BITUTIL="${srcdir}/bitutil-1.0.0" \
    -DFETCHCONTENT_SOURCE_DIR_CHARUTIL="${srcdir}/charutil-1.0.0" \
    -Wno-dev
    # -DFETCHCONTENT_SOURCE_DIR_AESCRYPT_LM="${srcdir}/aescrypt_lm-1.0.2" \
    # -DFETCHCONTENT_SOURCE_DIR_CHARUTIL="${srcdir}/charutil-1.0.0" \
    # -DFETCHCONTENT_SOURCE_DIR_STF="${srcdir}/stf-1.0.0" \
  cmake --build "${_pkgsrc}/build"
}

check() {
  cd "${srcdir}"
  ctest --test-dir "${_pkgsrc}/build" --output-on-failure --stop-on-failure
}

package() {
  cd "${srcdir}"
  DESTDIR="${pkgdir}" cmake --install "${_pkgsrc}/build"

  cd "${_pkgsrc}"
  install -vDm644 "CHANGELOG.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
  install -vDm644 "README.md"    "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE.md"   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}

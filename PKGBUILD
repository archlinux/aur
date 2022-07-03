#!/hint/bash
# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>

# Configuration
# shellcheck disable=SC2015
((DISABLE_OPENCL)) && {
  CMAKE_FLAGS+=("-DLUXRAYS_DISABLE_OPENCL=ON")
} || {
  depends+=(opencl-icd-loader)
  makedepends+=(opencl-headers)
  optdepends+=("opencl-driver: for gpu acceleration")
}
# shellcheck disable=SC2015
((DISABLE_CUDA||DISABLE_OPENCL)) && {
  CMAKE_FLAGS+=("-DLUXRAYS_DISABLE_CUDA=ON")
} || {
  makedepends+=(cuda)
}

pkgname=luxcorerender
pkgver=2.6
#_rel="rc1"
[ -n "${_rel}" ] && _pkgver=${pkgver}${_rel} && pkgver+=".${_rel}" || _pkgver=${pkgver}
_name=LuxCore-${pkgname}_v${_pkgver}
epoch=2
pkgrel=5
pkgdesc="Physically correct, unbiased rendering engine."
arch=('x86_64')
url="https://www.luxcorerender.org/"
license=('Apache')
depends+=(blosc boost-libs embree glfw gtk3 openimagedenoise openimageio openvdb openmp)
optdepends+=("pyside2: for pyluxcoretools gui")
makedepends+=(boost cmake doxygen git ninja pyside2-tools)
provides=(luxrays)
source=("https://github.com/LuxCoreRender/LuxCore/archive/${pkgname}_v${_pkgver}.tar.gz"
        "0001-glfw.patch"
        "0002-boost107400.patch"
        "0003-python.patch"
        "0004-cpplib.patch"
        "0005-clang-isnan-isinf.patch"
        "0006-openexr3.patch"
        "0007-silence-compiler-warnings.patch"
        "0008-silence-preprocessing.patch"
        "0009-openvdb.patch"
        "0010-spdlog.patch"
        "0011-openimageio.patch"
        "0012-opencolorio.patch"
        "0013-boost179-fstream.patch"
        )
sha256sums=('b844989b8229bf02f3c8aa6845be6a587aa5ae55a45861591119ad0e1a195867'
            'd4f16fc1b21f2a5b9981db6157ebf64ceb6a9e0719cbbe2126d82c3013caa4ab'
            '8c9f3554252e4679e0d0a9fc4ad98a9e48846cea396e067466b4b809a945330c'
            '0b6c8328b4af7390061ba36fbc58eb444a17bce3ef169f5c046f51d2059833fe'
            'd1b469b86d875757e57df9d9567fa7e242c56673b1158cc085e3ce7f846cdb78'
            '99cb5223b70a3c1be84ce8639e60b747245f0a81538ff859ecdc63a3f30ec5ef'
            '8a4f1811965f6dead9e3129f991a068b22585aaee1a25f51cfcc1155f8200060'
            '464afd2eeddb18bfcdbeda7b21bafe32aced4ca9e7f23145726914839918a2bf'
            '6c9aa23e19565166ea5fdac569129f245c8e066566bf6f64bc539016a8978ba9'
            '60873c7b7123fc586fa7f0b5ebb34bada035baab7f82bf2d2ccbc2b145ed3757'
            '29e673797cf8982434d9cff6adb47b6beb14ebc3062d767430ae51bf4bbae398'
            '3dbb879a1720faf02bead50a5645e1036ace4b5c561667a4cabf4f5e8134d1b9'
            '12ce172728510cdaa9fe8b550a9577befece9b013d78b4b5b6d2da5e415eea82'
            '48c4f8b73ec5fbcf5b5665fe4056554759e7691da4abe6e1169a17562e525b6d')
b2sums=('ead966b0df7bb72ac9aa2aefb1e5f2dd020156a8e66f67aeff75d29606072ea7b147ddc4d6effea687baf4653e670bd3ad93fc9c7b0e7cac340cb1d5976adb14'
        '6b9671a2d8d335a9a551b60f6e616210a56dd89ae20d7b5b41fb55fc96b97f09bee830b8fd23d832bf2dcd05eeafe16a421d69435032424a3796d719cc352bee'
        'e99e1d551235c0f11ca018136caf2fbb283cb2e03dd9f16c05b93ffb4f37fea45d95008c84d8cac174f225ae13aecf3d02d7639fe8c22e006de00e3189c0fc7e'
        'aaad4781bfcc07cb3c0a25449c7c52be541e9dfb9c907b8684876f8dd8fd8aec1ba900903d97d8e4e3b95c494acb7f7aaee4c1b1e7e8e3302c62bc3297abc83a'
        'd64e8e17e60b452f9b3e472293e08caa428937958ba3ae24f0a05b7d9e70a20e1b5d6ab60f901d508241d279905b7226c2ce4de3f378ed62bad88e03fdd5a0c0'
        'a90af82a64a4a005271931a19671c699dcbe9b7bef609190ca060b65124f85e2cefedd1e0e2d4983a8c231d20af485e3fca3fdbc9e5046ae84bf70919f6b0424'
        '6c365150d2e63934f6de30e3f6d15260a54a3ca6c8aa5e0d1d56c3ee6f522df6eaeab81052cebf579df5be6c8750d6d606cf7dfad107316c84cfb3da31bd76c9'
        'b1be50e479cd8d452faccb614a9ce1ebebd0a87832055446c988578d57c03fb315be561eab09849bbb053f2ba0b1daf95c7d4bb430ea4ad23f825eb8519d4542'
        '484629720dbd2313291428bf4f6996b5a2ccd8df79eae289b0fd766476bdbbe69a75b9628d00d7af89ea24f9cabee4cd4fd01ed30f520b1cbb253fd3e08e87bd'
        '7a481ac8e1fd2e36f7dbb6297b48b2cc599e71c1752bc56c59179abe40c8ebe5c84319d79e41673f4516f42c56aa01df66d71a761773615e15f8d8ce1d01f56d'
        '62e39a787c9bdb97999fcb38d97120f90d0895357757e36b8bdf3c4a5b57c67a982f37a905aec98904ca659accddfa47c64e7f5200aac4dc86e17adacfedd328'
        '2457826edfa6de29da4423cb1473f6875255d6f9cbea1c3b39e66d94029fd9e782c911ff4a67a9ca975c77c5e6c1ad9d489253246c8a7543a7a4e8db4a859313'
        'c56661331a66a5ea4b3598ecf69dcfdb6fcd6e635f76aaa3eabcd3e0752327b64566458c2489e58db4f568d9066a9413bac98e2942d759091754873330b59b4d'
        '828f40e954eeb2e47b10bc8b2173000308897042d31cc232d47f5c5883f38e6702c5d62a61446778467bdf398fe9bda0bebfeeea85a88e0bc914af35cd2d1201')

prepare() {
  for patch in "${srcdir}"/*.patch; do
    msg2  "apply $patch..."
    patch -Np1 -d "${srcdir}"/${_name} -i "$patch"
  done
}

build() {
  _pyver=$(python -c "from sys import version_info; print(\"%d%d\" % (version_info.major,version_info.minor))")
  CMAKE_FLAGS+=("-DPYTHON_V=${_pyver}")
  cmake "${CMAKE_FLAGS[@]}" -S "${srcdir}"/${_name} -B build -G Ninja
# shellcheck disable=SC2086
  ninja $(grep -oP -- '-+[A-z]+ ?[0-9]*'<<<"${MAKEFLAGS:--j1}") -C "${srcdir}/build"
}

package() {
  cd "${srcdir}"/build

  install -d -m755 "${pkgdir}"/usr/{bin,include,lib}
  install -m755 bin/* "${pkgdir}"/usr/bin
  install -m644 lib/* "${pkgdir}"/usr/lib
  cp -a "${srcdir}"/${_name}/include "${pkgdir}"/usr
  for file in "${pkgdir}"/usr/include/*/*.in; do mv "$file" "${file%.in}"; done

  # install pyluxcore to the Python search path
  #  _pypath=`pacman -Ql python | sed -n '/\/usr\/lib\/python[^\/]*\/$/p' | cut -d" " -f 2`
  _pypath=$(python -c 'from sys import version_info;print("/usr/lib/python{}.{}".format(version_info.major,version_info.minor))')
  install -d -m755 "${pkgdir}/${_pypath}"
  mv "${pkgdir}"/usr/lib/pyluxcore.so "${pkgdir}/${_pypath}"
}
# vim:set ts=2 sw=2 et:

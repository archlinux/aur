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
  makedepends+=(cuda-sdk)
}

pkgname=luxcorerender
pkgver=2.6
#_rel="rc1"
[ -n "${_rel}" ] && _pkgver=${pkgver}${_rel} && pkgver+=".${_rel}" || _pkgver=${pkgver}
_name=LuxCore-${pkgname}_v${_pkgver}
pkgrel=11
epoch=2
pkgdesc="Physically correct, unbiased rendering engine."
arch=('x86_64')
url="https://www.luxcorerender.org/"
license=('Apache')
depends+=(blosc boost-libs embree3 glfw gtk3 openimagedenoise openimageio openvdb fmt9 python spdlog)
optdepends+=("pyside2: for pyluxcoretools gui")
makedepends+=(boost cmake doxygen git ninja pyside2-tools pyside6-tools-wrappers)
provides=(luxrays)
options=('!lto')
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
        "0010-openimageio.patch"
        "0011-opencolorio.patch"
        "0012-boost179-fstream.patch"
        "0013-spdlog.patch"
        "0014-fmt9.patch"
        )
sha256sums=('b844989b8229bf02f3c8aa6845be6a587aa5ae55a45861591119ad0e1a195867'
            '818366af720ef49b57c604791caeef0dc5dccf549b764001fdfe2be5016296d6'
            'a8293ca87b18bfd12e05c8fec42c7a29001ec50a5996fb0038cdbc5eb8167b55'
            '11471500540a53b2ca4e2289c187a388c76aa388a8f51fd6b9981d36e6cb95f7'
            '261df8e99dacea6261ad513d3e3edd2e69fab953316d7a789a97789178019e7f'
            'cb2f0441c0fb9046952dc89dbd0ec38fcfbcfaefba3644358cde881b71c70b77'
            '488382fbf7c62aff55cfa517c74dbed0f2abea7fd060942fa3836750bf65f439'
            '5bf12f95d393d62ee5a11f13db1df46c20958d5832f654d8e8cfad88b6e5892e'
            'a2c5901b7e9eeee9a928f8f568493303fc58fb7ca1e6801533e9af53f0cbe470'
            '21dbaa1df164feed463b9caf4aff5733f7b4c8e404b7ec6ad0fc0784151adb4d'
            '010f1a88c238a00e5ea035766514a7fe5c45dc45f247a2240821b10ffb30b6dd'
            '6c34263d955440cb200ddb6f51711fca9b5548ca9ccf133cc924f87298f4dce0'
            '069ca9caef3b7c85ffc4a55de79122488b1b513135b0536b24772c483c8d0cab'
            'b8b3d9d4432198e34a281f24c0ffedb4a9f69ce8ee36c30125b83b4a6c6358f6'
            'e4ad9b7a0b77e0ca00136159f8f7c8e5940d26918421f18114ad5657fbf32359')
b2sums=('ead966b0df7bb72ac9aa2aefb1e5f2dd020156a8e66f67aeff75d29606072ea7b147ddc4d6effea687baf4653e670bd3ad93fc9c7b0e7cac340cb1d5976adb14'
        '1a1f4de4f70564216a99f1a27c6321c85187eaea80d9a2a47c66be07fa4a1d825eeef526167aaeb89e4bd67a376a56728af95ee00ee8c1bcc7556afce5f126b0'
        '56fa362f1a79e735377b85b1a5303d0761b0b022b9b4a6063af8aee19643bcef0663105cefd969e746ace5cf7e13f3d0da2b7fc696ba0b500f2c21bb57f1bddb'
        'fde24f909b7f639ac4b1d113710a0e4fb2b1fde97bdbdd905c76fc864bd016fa13965452d5d63dd522ac40663ed8a2e609b93d391e01891f5e780e712f3169c4'
        'd1a5dd49df142d5bc352240e5674aab30f94775a645598328f4dcc4db17ed208b8cfb818b8f7510d4d031511191290920bd2ebc7ed3776b031febd4ddc94e0bc'
        '1ec46e7b28ab00ef696d06f5c0ba6d5fdfe9dc448d9be415239a8013f92334603be8b577c7c3b406648c8e6fe1738933d40b335fb777bc5e90dd623abab05061'
        '2249bb65fab1dd4f01077ffa530dfa15d5612c47436819a266c307a16699d978a5fbd5beea9ca066d8877177264095a18af030cc1e7bd3376fc1c4b0f9566647'
        '38b9ee28c6453f190c1325846b91f7760ceec3ad2708bc63d6ca46aa58b93b04b21112eab14c07a6ce624f3974f224a7d398a2b392a83f25df8af02b40448b4b'
        '5a5fbb58d92e550000c02b26dcca6c0d5bc1b2aa1d5ad93ea303f71a03a67391a06ae3e0f015392c08c35ffb413900fca383834c113fdd90d3db8c74db28db01'
        '4fef3e631b55cc1a6449bf6e7546d82459b1386674d079306052c0457699e01e6feec785e317e5e820b5b5bcab32c400ea9c2aa4846c86e7404c541586368a3c'
        'efe5fcf5065a93bab4a9442eca8c57d780e55a21fbda895cfdda95c1d751834805b49418752578125fb0317136528485d1be6e0d2b6e0d7c971608e38137ca18'
        '19a81a9c442272e7d0123bc99b93be8cafab1a84a7a9bbb58e92e5a6624277e85b33c41183e739ebb8898aa886d477854c9075457a4da9266a5a8a0b26387ae0'
        '1d434b3eb400af3b4db9ad1fd3f40d8cfcae6d7adcb0912f3fb243f5f824f1df72b6ccd044fc22d7ca5b7476e58ce3ffce0eadbe5d9e8f5a07ab9fcecc85b776'
        '34176c1fd0e8e22daab5a986b67a6732170376a618a2e59cf0a3b6ca33c6f1407f61c8a1c92f00cdce1bee850ade295d8092691191d4c2c7cbc05016c4c791d6'
        '084628e44473a2ddb5fdcffb5ddab5dabf02aee46de01a3a0f22f0ffab958be3980494078a7b4b2fcd2168a4d048de13ac14cecd26dda97ff00037e41ca50c11')

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

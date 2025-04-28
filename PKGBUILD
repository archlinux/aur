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
pkgver=2.7
_rel="beta1"
[ -n "${_rel}" ] && _pkgver=${pkgver}${_rel} && pkgver+=".${_rel}" || _pkgver=${pkgver}
_name=LuxCore-${pkgname}_v${_pkgver}
pkgrel=2
epoch=2
pkgdesc="Physically correct, unbiased rendering engine."
arch=('x86_64')
url="https://www.luxcorerender.org/"
license=('Apache')
depends+=(blosc boost-libs embree3 glfw gtk3 openimagedenoise 'openimageio<3.0' openvdb python spdlog)
optdepends+=("pyside2: for pyluxcoretools gui")
makedepends+=(boost cmake doxygen git ninja pyside2-tools)
provides=(luxrays)
options=('!lto')
source=("https://github.com/LuxCoreRender/LuxCore/archive/${pkgname}_v${_pkgver}.tar.gz"
        "0001-cxx-version.patch"
        "0002-silence-compiler-warnings.patch"
        "0003-silence-preprocessing.patch"
        "0004-glfw.patch"
        "0005-boost107400.patch"
        "0006-python.patch"
        "0007-cpplib.patch"
        "0008-clang-isnan-isinf.patch"
        "0009-openexr3.patch"
        "0010-openvdb.patch"
        "0011-openimageio.patch"
        "0012-opencolorio.patch"
        "0013-boost179-fstream.patch"
        "0014-spdlog.patch"
        )
sha256sums=('24adaf0da781921ed18c2aee55468ee94138db023e5cff95a5ede0fb394f8c09'
            'd3e0c4f74341746bf271efa6a62f3f0e2a72072afd86c032a9a5a1a565cf28f0'
            '540f6e92877165c06ce70d2c7ac5c28ec95632520941b645f63ffa5d77541693'
            'd754596d2c17a3d12fa38abb373f4a58b2ca7a0b8df8fdf7ba9e991753998b6b'
            '77db48d1a823f345a170c0632d3bfa0a962c92f6c662117e2a96a172d48732e9'
            '415ba07ff99f9b97106aa806c6c1b40b68be3c39096ecd08cd2e0d40e6ea2fc3'
            'fa142fa282ae3e2482e7c39ffa07382d68ad732f32468eae5aa67d4378efc144'
            '71b62a8c8c61779d914ce8e10bb5594dd0ed8bfecc1d6007263870393bb89955'
            '09bf685f7367b05ac2d756e22c3b8d7a1ba931bca7ef4d6096852bbcdd203f8b'
            'e2034c00d456cf04843f84ee36eca991498a9580d52d15fafebe63f61642afb2'
            '12bb2b0873b14f7878b9ec05b36a18156879b770da5ba47505bf3d6004038092'
            '9eca0d8c3de4088ed02b40b5269ce709077f0b810eaa570050d9f41c320e79ee'
            '1d91f515a4fcfb88119e02a71f4a5185a6765991296cd1d4760e36a642c29ff1'
            '3185b3e4b42423fb51ef007e9f36f193ef7bd54bb83efdb242e7ba3c6fb67532'
            'ca46c01fbe2183916e20e990c23991148e878e401cec6d9ddabf7aa6bfdc6933')
b2sums=('0f6203610dbef2fd2d43c6465502459337eb99da00b494d7bfcab245b8fdb3d9f9179018e6d9b2f927024f6a21fba4d5cfb51e9e14049d1a56ce8aabaea2312d'
        '2b8c411347c4b27b21cddf7f4543beeaa229968e95f59f762b872264afd23cb5cea8074bd606b8e56df1a84473ada13720f8fb097fcfb80303495a89ed9052ef'
        '97302dc99edebe5f35d5d469b2a2a9172eb7357248fb2bcc4510507de59a4d1db32cbfaf18acbba29b5046011615f57eb6ab322346560ec2777172c6b08a30b9'
        'c951ce3d6172c0a916c13fa53c682336a74d229c6e903f26c40f7a6e91a6b3ff54241178f85e4945d621210d23f54503b95e69d0f05e40246165eb23422aafb9'
        '88e40b301961daef2e493b71cbd497aeb63035e9ed1ff2078c98c6a2c0e17f7c23a712905cd335ad3cc518b7b53b503441b261bc04ee6a27cb8531f74ec019f8'
        '8ef8933c5dc6acb0881ddb51f959530eeda80c7d7d0a1e26ce5878e19b082746e95af8bee53e5937276e500473bbd56137cf68e5901b2a0a48d9255e11016cbf'
        '96708a30229163849cefc4e7e13db571fe2529f08952a999a2176f99b4748869391184345780ef22d74ae8c93fb18b0a8831fcb5f3b043bcb63b545e90396205'
        '7c8979e9549b03f0535d5760d9929acfb0d954b027253ec42ce910033c5aac60a34af3bbe92b6b07b9a3d0c0e66a43373b74697bdbc91e2ca6ae42ae4866352d'
        '947d3cba2c9e1c4c430f9623a13f5275613491ac1125c88b042dc4bb0fa6905c8955731e75e954850035f3605df12fdf5f77b5caec7495b3d321aa6eb357bd57'
        '3e2431d7b0175a7ec0ac452d0201222a26d16cb02191aa7a65a14cfb6af5a99109e82efeb8125f5b8b76314bfbc8ede5d055da5955cfa5d0238870d9de3bd73c'
        '76ee674dcbcd52c698924cbcd547d2b8a4b3761cf2ade8d7c463b2a5bdc9f741537485ce9db12968d3b43a28cca1508223e3a363fc7c0b7b9483e107d77155e7'
        '6ebaf49099a78adb59c0f9c601410529b8709377ec1c6eacf9510bdf5fba5027cdd81bae6422425cceab6ee1ebb4709a3edf9d818fcce2a5b475e009153a7842'
        'f56cec862ace8a1499a1a718f3c88488661b7d683d4e9bafc027d20fcb6542ce91a70f11ad46dd7a5ad0e61f2cd8dff6247617ad8d51b378e96fdc5e0c1ae94a'
        '78333747e508f28293c85175e0f9d0624b8303c1f4f5491304e79c3dbc104fedf4eaac9065f0876a968d379898eb5810cd802350adae44de5f44673b0949f1ba'
        '5e59c732a417775984cd85755b7a1810b33fb8a09cb3a8542c048958e7788d1aac3ecef5f28266278ca6444e1f59421b1d167a305eda9e70c0ae62155c01274b')

prepare() {
  mapfile -t patches < <(grep -Po '^.*?(patch|diff)(?=::|$)' < <(printf "${srcdir}/%s\n" ${source[@]}))
  for patch in "${patches[@]}"; do
    msg2  "apply ${patch##*/}..."
    patch -Np1 -d "${srcdir}"/${_name} -i "$patch"
  done
}

build() {
  _pyver=$(python -c "from sys import version_info; print(\"%d%d\" % (version_info.major,version_info.minor))")
  CMAKE_FLAGS+=("-DPYTHON_V=${_pyver}")
  CMAKE_FLAGS+=("-DCMAKE_BUILD_TYPE=Release")
  cmake "${CMAKE_FLAGS[@]}" -S "${srcdir}"/${_name} -B build -G Ninja -DCMAKE_POLICY_VERSION_MINIMUM=3.5
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

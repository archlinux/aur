# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

# This file is created from PKGBUILD.sh.ep contained by the mentioned repository.
# Do not edit it manually! See README.md in the repository's root directory
# for more information.

# All patches are managed at https://github.com/Martchus/qtbase

_android_arch=x86-64
pkgname=android-x86-64-qt6-base
_qtver=6.8.2
pkgver=${_qtver/-/}
pkgrel=1
arch=(any)
url='https://www.qt.io'
license=(GPL3 LGPL3 FDL custom)
pkgdesc='A cross-platform application and UI framework (android)'
depends=('java-runtime-headless-openjdk=17' 'ant' 'android-ndk' 'android-sdk' 'android-sdk-build-tools'
         'android-sdk-platform-tools' 'android-platform-34' "android-${_android_arch}-libjpeg-turbo"
         "android-${_android_arch}-libpng" "android-${_android_arch}-openssl" "android-${_android_arch}-zlib")
makedepends=('android-cmake' 'android-pkg-config'
             'java-environment-openjdk=17' 'qt6-base' 'ninja')
optdepends=('qt6-base: development tools')
# note: Using the java-environment-openjdk and android-platform-X versions that match what is documented
# on https://doc.qt.io/qt-6/supported-platforms.html#android because using unsupported versions is not a
# good idea (see e.g. https://bugreports.qt.io/browse/QTBUG-119223 for Java; using a newer version of
# android-platform also did not work in my tests with Qt 6.7.2 and android-platform 35).
options=('!strip' '!buildflags' 'staticlibs' '!emptydirs')
groups=(android-${_android_arch}-qt6)
_pkgfqn="qtbase-everywhere-src-${_qtver}"
source=("https://download.qt.io/official_releases/qt/${pkgver%.*}/${_qtver}/submodules/${_pkgfqn}.tar.xz"
        '0001-Use-CMake-s-default-import-library-suffix.patch'
        '0002-Fix-finding-D-Bus.patch'
        '0003-Fix-using-static-PCRE2-and-DBus-1.patch'
        '0004-Fix-transitive-dependencies-of-static-libraries.patch'
        '0005-Fix-libjpeg-workaround-for-conflict-with-rpcndr.h.patch'
        '0006-Support-finding-static-MariaDB-client-library.patch'
        '0007-Allow-overriding-CMAKE_FIND_LIBRARY_SUFFIXES-to-pref.patch'
        '0008-Find-fontconfig-via-pkg-config-for-correct-handling-.patch'
        '0009-Fix-dependency-of-xcb-image-on-xcb-util.patch'
        '0010-Allow-using-properties-of-PkgConfig-targets-for-glib.patch'
        '0011-Allow-using-properties-of-PkgConfig-targets-for-Wayl.patch'
        '0012-Allow-overriding-preference-for-shared-libzstd-libra.patch'
        '0013-Fix-errors-due-to-disabled-exceptions-with-cpp_winrt.patch'
        '0014-Fix-setting-exception-flags-of-plugin-targets.patch'
        '0015-Link-corelib-correctly-against-runtimeobject-when-co.patch'
        '0016-Workaround-linker-error-about-missing-symbol-__sync_.patch'
        '0017-Workaround-Unknown-CMake-command-_qt_test_emscripten.patch'
        '0018-Fix-configuration-when-EMSCRIPTEN_ROOT-is-an-absolut.patch'
        '0019-Android-Quit-hosting-Context-only-when-app-is-entire.patch'
        '0020-Allow-handling-Android-activity-lifecycle-by-user-pr.patch')
sha256sums=('012043ce6d411e6e8a91fdc4e05e6bedcfa10fcb1347d3c33908f7fdd10dfe05'
            '051cb9dcb386b105041ed6ae0a38e93065bde09d6b882d5447d8f1bd5670254b'
            '039404d6756fb098f5903276121f1ad9e3d64f7eb3296b34cc8c1eebc5b63da6'
            '43159d690844ed17335887d2114ecc9ac21f44fe57206e266e646108f5184dd8'
            '2abdcfb3b908675f9ad5b4202ce049817921429a6c40098d084ec52468748973'
            '89010fd80362c9f453a68217f4efa5555588694364cceb839912031ef058a937'
            '7bf5497774491bfef0408009381de60bf6900636305e772adcfc5e45e1a3c0bb'
            '024cf2b14e8684dbca4399eda2dd6f413e35c92f7233163ddf2f4308d76cfdc6'
            'ca97fe8f78483922308c0d690fe8c68f865bc3993ed9aa392d4e0c8982534c2b'
            '45aac954f872cb94801de47e959eb9ebcb160ff17e39669ad6d4e90443ca46dc'
            '47dce10c6ee16971a38a0112ca2011f90c035f78c9ac66e948ff58f1cd7a4cf2'
            '1a2fe9b452fbe72bd7216ef0dff760044579fd43c859c2e4d52c07cf8e336eab'
            '0fe1cc0c25e72346c1f6659e37b3df8866b36e2df28a093697b01fdab32d5303'
            '605d3460fa2a008d2be22f257595f9b39a6d5acd4bd2825f90dae50aecd26fa6'
            '4f352e3e26d6eddf99782a4e492078c3d30f60f035a54ad6c12f054a016c201f'
            '14f6ba22d257c815b7d75f5a68bbd24d9bb2eabfe97194b78a95a996f9e6ad65'
            '33ab37d8b69cb3d69986ae993439a19daba04905c4222830b7c6c6bb0903e712'
            '589127fc77d0a52952fda679953e085a13f8a63e1c871c3faf9a4fb61356bd3a'
            '7b7497a62d4d0a259f53ff9e1edf2a4ade7260e9a94d00ce922f670424a9ecd2'
            '77e5e4e3d2f32184fa615f8cd4c8e165f6122d822c4a74d3485554680a4f9aef'
            '103d819d4b13d7c3354b66faddf74e01392091071e51011c52c8230376fe4463')

prepare () {
  cd $_pkgfqn

  # apply patches; further descriptions can be found in patch files itself
  for patch in "$srcdir/"*.patch; do
    msg2 "Applying patch $patch"
    patch -p1 -i "$patch"
  done
}

build() {
  export PATH=/usr/lib/jvm/java-17-openjdk/bin:$PATH
  source android-env ${_android_arch}
  android-${_android_arch}-cmake -G Ninja -B build-$_android_arch -S $_pkgfqn \
      -DCMAKE_FIND_ROOT_PATH="${ANDROID_PREFIX}" \
      -DQT_BINARY_DIR=${ANDROID_PREFIX_BIN} \
      -DQT_INCLUDE_DIRS_NO_SYSTEM=ON \
      -DQT_HOST_PATH=/usr \
      -DANDROID_SDK_ROOT=${ANDROID_HOME} \
      -DANDROID_NDK_ROOT=${ANDROID_NDK_HOME} \
      -DANDROID_STL="c++_shared" \
      -DFEATURE_pkg_config=ON \
      -DFEATURE_system_pcre2=OFF \
      -DFEATURE_system_freetype=OFF \
      -DFEATURE_system_harfbuzz=OFF \
      -DFEATURE_system_sqlite=OFF \
      -DFEATURE_system_libjpeg=ON \
      -DFEATURE_system_libpng=ON \
      -DFEATURE_system_zlib=ON \
      -DINSTALL_DOCDIR=share/doc/qt6 \
      -DINSTALL_EXAMPLESDIR=share/doc/qt6/examples \
      -DINPUT_openssl=runtime
  VERBOSE=1 cmake --build build-$_android_arch

  # note: Avoid using `-DINSTALL_` options like in the regular package to avoid any problems with androiddeployqt.
}

package() {
  source android-env ${_android_arch}
  DESTDIR="$pkgdir" cmake --install build-$_android_arch

  install -Dm644 $_pkgfqn/LICENSES/* -t "$pkgdir"/usr/share/licenses/$pkgname

  # Drop QMAKE_PRL_BUILD_DIR because reference the build dir
  find "$pkgdir/${ANDROID_PREFIX}/" -type f -name '*.prl' \
    -exec sed -i -e '/^QMAKE_PRL_BUILD_DIR/d' {} \;

  find ${pkgdir}/${ANDROID_PREFIX} -type f -name 'lib*.so' -exec ${ANDROID_STRIP} -g --strip-unneeded {} \;
  find ${pkgdir}/${ANDROID_PREFIX} -type f -name 'lib*.a' -exec ${ANDROID_STRIP} -g {} \;
  [[ -d "${pkgdir}/${ANDROID_PREFIX}/share/doc" ]] && rm -r "${pkgdir}/${ANDROID_PREFIX}/share/doc" || true
}


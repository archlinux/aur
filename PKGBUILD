# Maintainer: Martchus <martchus@gmx.net>
# Contributor: ant32 <antreimer@gmail.com>
# Contributor: Filip Brcic <brcha@gna.org>
# Contributor: jellysheep <max.mail@dameweb.de>

# BEFORE COMMENTING OR REPORING ISSUES, PLEASE READ THE FILE `README.md` IN THIS REPOSITORY.
# ALSO HAVE A LOOK AT THE COMMENTS IN THE AUR.

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

# All patches are managed at https://github.com/Martchus/qtbase

# Helper functions for the split builds
isDefault() {
  [[ $pkgname = 'mingw-w64-qt5-base' ]] || [[ $pkgname = 'mingw-w64-qt5-base-static' ]]
}
isStatic() {
  [ "${pkgname##*-}" = 'static' ]
}
isOpenGL() {
  # Currently use native OpenGL by default
  isDefault || \
  [[ $pkgname = 'mingw-w64-qt5-base-opengl' ]] || [[ $pkgname = 'mingw-w64-qt5-base-opengl-static' ]]
}
isANGLE() {
  [[ $pkgname = 'mingw-w64-qt5-base-angle' ]] || [[ $pkgname = 'mingw-w64-qt5-base-angle-static' ]] || \
  [[ $pkgname = 'mingw-w64-qt5-base-dynamic' ]] || [[ $pkgname = 'mingw-w64-qt5-base-dynamic-static' ]]
  # Treat dynamic version like ANGLE version, correct?
}
isDynamic() {
  [[ $pkgname = 'mingw-w64-qt5-base-dynamic' ]] || [[ $pkgname = 'mingw-w64-qt5-base-dynamic-static' ]]
}
isNoOpenGL() {
  [[ $pkgname = 'mingw-w64-qt5-base-noopengl' ]] || [[ $pkgname = 'mingw-w64-qt5-base-noopengl-static' ]]
}

pkgname=mingw-w64-qt5-base-dynamic
pkgver=5.12.0
pkgrel=2
pkgdesc='A cross-platform application and UI framework (mingw-w64)'
# The static variant doesn't contain any executables which need to be executed on the build machine
isStatic && arch=('any') || arch=('i686' 'x86_64')
url='https://www.qt.io/'
license=('GPL3' 'LGPL3' 'FDL' 'custom')
depends=('mingw-w64-crt' 'mingw-w64-zlib' 'mingw-w64-libjpeg-turbo' 'mingw-w64-sqlite'
         'mingw-w64-libpng' 'mingw-w64-openssl' 'mingw-w64-dbus' 'mingw-w64-harfbuzz'
         'mingw-w64-pcre2')
groups=('mingw-w64-qt5')
optdepends=('mingw-w64-postgresql: PostgreSQL support' 'mingw-w64-mariadb-connector-c: MySQL support')
makedepends=('mingw-w64-gcc' 'mingw-w64-postgresql' 'mingw-w64-mariadb-connector-c' 'mingw-w64-pkg-config')
options=('!strip' '!buildflags' 'staticlibs' '!emptydirs')
_pkgfqn="qtbase-everywhere-src-${pkgver}"
source=("https://download.qt.io/official_releases/qt/${pkgver%.*}/${pkgver}/submodules/${_pkgfqn}.tar.xz"
        '0001-Adjust-win32-g-profile-for-cross-compilation-with-mi.patch'
        '0002-Ensure-GLdouble-is-defined-when-using-dynamic-OpenGL.patch'
        '0003-Use-external-ANGLE-library.patch'
        '0004-Fix-too-many-sections-assemler-error-in-OpenGL-facto.patch'
        '0005-Make-sure-.pc-files-are-installed-correctly.patch'
        '0006-Don-t-add-resource-files-to-LIBS-parameter.patch'
        '0007-Prevent-debug-library-names-in-pkg-config-files.patch'
        '0008-Fix-linking-against-shared-static-libpng.patch'
        '0009-Fix-linking-against-static-D-Bus.patch'
        '0010-Don-t-try-to-use-debug-version-of-D-Bus-library.patch'
        '0011-Fix-linking-against-static-freetype2.patch'
        '0012-Fix-linking-against-static-harfbuzz.patch'
        '0013-Fix-linking-against-static-pcre.patch'
        '0014-Fix-linking-against-shared-static-MariaDB.patch'
        '0015-Fix-linking-against-shared-static-PostgreSQL.patch'
        '0016-Rename-qtmain-to-qt5main.patch'
        '0017-Build-dynamic-host-libraries.patch'
        '0018-Enable-rpath-for-build-tools.patch'
        '0019-Use-system-zlib-for-build-tools.patch'
        '0020-Use-.dll.a-as-import-lib-extension.patch'
        '0021-Merge-shared-and-static-library-trees.patch'
        '0022-Pull-dependencies-of-static-libraries-in-CMake-modul.patch'
        '0023-Allow-usage-of-static-version-with-CMake.patch'
        '0024-Adjust-linker-flags-for-static-build-with-cmake-ming.patch'
        '0025-Use-correct-pkg-config-static-flag.patch'
        '0026-Fix-macro-invoking-moc-rcc-and-uic.patch'
        '0027-Ignore-errors-about-missing-feature-static.patch'
        '0028-Enable-and-fix-use-of-iconv.patch'
        '0029-Ignore-failing-pkg-config-test.patch'
        '0030-Prevent-qmake-from-messing-static-lib-dependencies.patch'
        '0031-Hardcode-linker-flags-for-platform-plugins.patch'
        '0032-Fix-linking-against-static-plugins-with-qmake.patch'
        '0033-Disable-hardware-randomizer-for-32-bit.patch')
sha256sums=('5e03221d780e121aabd734896aab8f331e5d8c9d9b54f1eb04907d0818eaeecb'
            '5384b242223f2219c933c098397c287f387ef0b736633200c647c6feed69cc85'
            '01e71d5375ff6fb214e0b4f623f3c007485885d8e1fdfc185a1d25b6d1ea615a'
            'c2d68bcba25bd39f3d7f95271de99a28f0de33f98ae0a4f102728a48a58fa2b8'
            'cbeb19172eab4d2faef020560fb83190ac975fa54acaaf006a7b720e45b4fa43'
            '81f9e6a05b8c78392b0b8eb08535480cd9e0ebb6ed77ecffcf382f133482f55f'
            'fbcb5b586ec3a6723ac19378c40f1b28d12e8f0745db1016e38e040e6aad5e7b'
            'cffb2cc60dd4aed39dec14bef889e0e4a5fe8d1171297fdd0d31d65c58cb6591'
            '971f0176651edf8bafb1cd5062f04f1e840cc703ee85fabc1d04face637368b2'
            '6a2e839aa513a32a2f615fbd9a010a4e9db219fe5a35678b290d52ed4ebde9eb'
            '7696e92e2b5d9c6be69d0ffe520f3539ee8b25d019b460319e7e6c1a90805b8f'
            '4db1340b60add08de2eb9e365c2c9b45fbdbb9137a42c1631e6589527b66f197'
            'a3ceba043bd7eb078a850a0189afe8e0c431e39a5d88c8c4f1609917388b8606'
            '9471df45a4c536f83d51e2ec83bdfd3b1d6233b4fcaa992c48a1155cc31396cd'
            'e2401d6cb5ccdd51406d0ff9abb8a75f28abcf0eeb5fa77cc7f02f9122f200b9'
            '25be17392e2b73f7d8a8868d1d0671c52ab58c7d03011f3e4a9c186e9a6a2a9a'
            '84fb80ff48e6146d57530df475532a94002812e4b11a04e49ee1537ad0c91242'
            '0e3a3f2c2bbdf5c66d823a6a4c9afa88794d97901e97c927f0ee761a9bf11db6'
            'bcef0c63c33e609098dd834e0a07e684eb75776ffd2f7db20edbc433b780fed0'
            '6c23bc2a75720c3f66f23ecb1944d5c58ac39d6a87e1609b0d444d87a5b3df5d'
            'df7a6f64dd5973a5208fc82ab2604be5e468c0460e78659a63649a9fe4bda865'
            'e983f369f7bacb6ecacbe5964ddd09a07abe2e6ddb8b8be5abeb6f4a3b2510d6'
            '86b494b28602b0c5228e3ab14f5d22c66e2d9f19b77bc6027eb991cd99b8c1e0'
            '00ce0189c216b3baf3874d2ae2f9437c6e7ef117206cca1abcf6b1108c7b2ad9'
            'e04105e95ecf5220f87dbf4d4bc4a5a09fb00a77a107679a63c9cbb62c84afae'
            '03d97deef6266959afefc3cb4c39b9be15880b07a16bb6f5cf72c71c0ae2897f'
            '4c1ce0fa776f7a7f62239e4c4ffd0270e99f9bd7545c3bf32c3ceb5276bede93'
            '2bb0550e924d57da83ce586dab9b90180daee196d0f5303dce0af07a7e509e0b'
            '73bfcc40a301521a5c977e0ed427e40d780ee7d1416f4fbb3c67d4e6c101bcd3'
            'd252d96f69c41f3b3112304d53773ff7549cb95cbe0cde171a79e41ee55f89ab'
            '9bb54043cc8a3b18aca222cea873d1651e881132985ad49402d63a69df518baa'
            'e4ee1aabed10b1ea4192498b6e80998425ab581d7ad44a9d880066f7017d481e'
            'a6640e6680f323f846e63e28f4ef343cfbec75397f7a103119b7b3415bcee260'
            '7758fd6412d8007518099b351e6661b5157a59e253f328c94f42980e3f977260')

_architectures='i686-w64-mingw32 x86_64-w64-mingw32'

isStatic && depends+=(${pkgname%-static})
if isANGLE; then
  if isDynamic; then
    makedepends+=('mingw-w64-angleproject')
    optdepends+=('mingw-w64-angleproject: use ANGLE instead of native OpenGL')
  else
    depends+=('mingw-w64-angleproject')
  fi
fi
if ! isDefault; then
  if isStatic; then
    provides+=('mingw-w64-qt5-base-static')
    conflicts+=('mingw-w64-qt5-base-static' 'mingw-w64-qt5-base-angle-static' 'mingw-w64-qt5-base-noopengl-static'
                'mingw-w64-qt5-base-dynamic-static' 'mingw-w64-qt5-base-openql-static')
  else
    provides+=('mingw-w64-qt5-base')
    conflicts+=('mingw-w64-qt5-base' 'mingw-w64-qt5-base-angle' 'mingw-w64-qt5-base-noopengl'
                'mingw-w64-qt5-base-dynamic' 'mingw-w64-qt5-base-openql')
  fi
fi

prepare() {
  cd "${srcdir}/${_pkgfqn}"

  # apply patches; further descriptions can be found in patch files itself
  for patch in "$srcdir/"*.patch; do
    msg2 "Applying patch $patch"
    patch -p1 -i "$patch"
  done

  # make sure the Qt 5 build system uses our external ANGLE library
  rm -rf src/3rdparty/angle include/QtANGLE/{EGL,GLES2,GLES3,KHR}

  # as well as our external PCRE library and zlib
  rm -rf src/3rdparty/{pcre,zlib}
}

build() {
  cd "${srcdir}/${_pkgfqn}"

  # do not set any flags here, flags are configured via mkspec
  # (Setting flags here is not appropriate as it does not allow to
  #  distinguish between flags for native compiler and cross compiler.)
  unset CFLAGS
  unset CXXFLAGS
  unset LDFLAGS
  unset PKG_CONFIG_PATH

  for _arch in ${_architectures}; do
    # define general configure arguments
    local qt_configure_args="\
      -xplatform win32-g++ \
      -optimized-qmake \
      -verbose \
      -opensource \
      -confirm-license \
      -force-pkg-config \
      -force-debug-info \
      -system-zlib \
      -system-libpng \
      -system-libjpeg \
      -system-sqlite \
      -system-freetype \
      -system-harfbuzz \
      -system-pcre \
      -no-fontconfig \
      -sql-mysql \
      -sql-psql \
      -sql-sqlite \
      -dbus-linked \
      -no-glib \
      -no-icu \
      -iconv \
      -nomake examples \
      -make tools \
      -hostprefix /usr/${_arch} \
      -hostdatadir /usr/${_arch}/lib/qt \
      -hostbindir /usr/${_arch}/lib/qt/bin \
      -prefix /usr/${_arch} \
      -bindir /usr/${_arch}/bin \
      -archdatadir /usr/${_arch}/lib/qt \
      -datadir /usr/${_arch}/share/qt \
      -docdir /usr/${_arch}/share/doc/qt \
      -examplesdir /usr/${_arch}/share/qt/examples \
      -headerdir /usr/${_arch}/include/qt \
      -libdir /usr/${_arch}/lib \
      -plugindir /usr/${_arch}/lib/qt/plugins \
      -sysconfdir /usr/${_arch}/etc \
      -translationdir /usr/${_arch}/share/qt/translations \
      -device-option CROSS_COMPILE=${_arch}- \
      -device-option CROSS_COMPILE_PREFIX=/usr/${_arch}"

    # allows using ccache despite the use of pre-compile header (sloppiness must be set to pch_defines,time_macros in ccache config for this)
    qt_configure_args+=' -device-option CROSS_COMPILE_CFLAGS=-fpch-preprocess'

    # add include directory of freetype2 and dbus manually (pkg-config detection in qmake doesn't work which is currently ignored via a patch)
    qt_configure_args+=" $(${_arch}-pkg-config --cflags-only-I freetype2 dbus-1 | sed -e "s/-I\/usr\/${_arch}\/include //g")"
    # note: The sed is required to prevent -isystem /usr/${_arch}/include (qmake will turn -I into -isystem) which would lead to
    #       the same issue as here: https://github.com/Martchus/tageditor/issues/22#issuecomment-330899141

    # enable debug build if MINGW_W64_QT_DEBUG_BUILD is set (could be set in eg. /etc/makepkg.config if debug build is wanted)
    [[ $MINGW_W64_QT_DEBUG_BUILD ]] \
      && qt_configure_args+=' -debug-and-release' \
      || qt_configure_args+=' -release'

    # configure usage of ANGLE/OpenGL
    if isOpenGL; then
      msg2 'Using native OpenGL backend'
      qt_configure_args+=' -opengl desktop'
    elif isNoOpenGL; then
      msg2 'Building without OpenGL support'
      qt_configure_args+=' -no-opengl'
    elif isANGLE; then
      if isDynamic; then
        msg2 'Using dynamic OpenGL backend'
        qt_configure_args+=' -opengl dynamic'
      else
        msg2 'Using ANGLE as OpenGL backend'
        qt_configure_args+=' -angle'
      fi
      # enable declarations of GLES functions
      qt_configure_args+=' -DGL_GLEXT_PROTOTYPES'
    fi

    # add include directory of MariaDB
    qt_configure_args+=" -I/usr/${_arch}/include/mariadb"

    msg2 'Configure and build qmake'
    mkdir -p ../build-${_arch} && pushd ../build-${_arch}
    if isStatic; then
      qt_configure_args+=' -static'

      # configure static version to use linked OpenSSL
      qt_configure_args+=' -openssl-linked'
      export OPENSSL_LIBS="/usr/${_arch}/lib/libssl.a /usr/${_arch}/lib/libcrypto.a -lws2_32 -lgdi32 -lcrypt32 -ldnsapi -liphlpapi"

    else
      qt_configure_args+=' -shared'

      # configure shared version to load OpenSSL dynamically
      qt_configure_args+=' -openssl-runtime'

      qt_configure_args+=' -device-option CROSS_COMPILE_CUSTOM_CONFIG=actually_a_shared_build'

      # override LD_LIBRARY_PATH so libraries for native build tools like libQt5Bootstrap.so are found
      export LD_LIBRARY_PATH="$PWD/lib"
      export LDFLAGS="-L$PWD/lib"
    fi

    msg2 'Build qmake and configure' && ../${_pkgfqn}/configure $qt_configure_args
    msg2 'Build Qt libraries'        && make

    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir/${_pkgfqn}"
    make install -C ../build-${_arch} INSTALL_ROOT="${pkgdir}"

    # use prl files from build directory since installed prl files seem to have incorrect QMAKE_PRL_LIBS_FOR_CMAKE
    pushd "$srcdir/build-${_arch}/lib"
    find -iname '*.prl' -exec cp --target-directory "${pkgdir}/usr/${_arch}/lib" --parents {} +
    popd
    pushd "$srcdir/build-${_arch}/plugins"
    find -iname '*.prl' -exec cp --target-directory "${pkgdir}/usr/${_arch}/lib/qt/plugins" --parents {} +
    popd

    if isStatic; then
      # The static release contains only the static libs itself but relies on the
      # shared release for Qt5Bootstrap library and tools (qmake, uic, ...).

      # drop Qt5Bootstrap and libraries which are only provided as static lib
      # and hence already present in shared build (such as Qt5OpenGLExtensions)
      rm -f \
        "${pkgdir}/usr/${_arch}/lib/"{lib,}qt5main* \
        "${pkgdir}/usr/${_arch}/lib/"{lib,}Qt5AccessibilitySupport* \
        "${pkgdir}/usr/${_arch}/lib/"{lib,}Qt5DeviceDiscoverySupport* \
        "${pkgdir}/usr/${_arch}/lib/"{lib,}Qt5EdidSupport* \
        "${pkgdir}/usr/${_arch}/lib/"{lib,}Qt5EventDispatcherSupport* \
        "${pkgdir}/usr/${_arch}/lib/"{lib,}Qt5FbSupport* \
        "${pkgdir}/usr/${_arch}/lib/"{lib,}Qt5FontDatabaseSupport* \
        "${pkgdir}/usr/${_arch}/lib/"{lib,}Qt5PlatformCompositorSupport* \
        "${pkgdir}/usr/${_arch}/lib/"{lib,}Qt5ThemeSupport* \
        "${pkgdir}/usr/${_arch}/lib/"{lib,}Qt5OpenGLExtensions* \
        "${pkgdir}/usr/${_arch}/lib/"{lib,}Qt5PlatformSupport* \
        "${pkgdir}/usr/${_arch}/lib/"{lib,}Qt5WindowsUIAutomationSupport* \
        "${pkgdir}/usr/${_arch}/lib/"libQt5Bootstrap* \

      # ensure config files don't conflict with shared version
      pushd "${pkgdir}/usr/${_arch}/lib/cmake"
      for cmake_dir in $(find . ! -path . -type d ! -name 'Static*'); do
        mkdir -p "./Static${cmake_dir:2}";
        mv "${cmake_dir}/"* "./Static${cmake_dir:2}";
        rm -r "${cmake_dir}"
      done
      rm -r "./StaticQt5OpenGLExtensions"
      popd
      rm "${pkgdir}/usr/${_arch}/lib/pkgconfig/StaticQt5OpenGLExtensions.pc"

      # create links to static plugins in lib directory
      pushd "${pkgdir}/usr/${_arch}/lib/" && ln -s "./qt/plugins/"*/*.a . && popd

      # keep a couple pri files not found in base
      mv "${pkgdir}/usr/${_arch}/lib/qt/mkspecs/modules/qt_plugin_"*.pri "${pkgdir}/usr/${_arch}"

      # delete duplicate files that are in the base package
      rm -fR "${pkgdir}/usr/${_arch}/"{include,share}
      rm -fR "${pkgdir}/usr/${_arch}/lib/"{qt/bin,qt/mkspecs}

      # move pri files back
      mkdir -p "${pkgdir}/usr/${_arch}/lib/qt/mkspecs/modules"
      mv "${pkgdir}/usr/${_arch}/"*.pri "${pkgdir}/usr/${_arch}/lib/qt/mkspecs/modules"

    else # shared version
      # remove DLLs from libdir (DLLs are installed in both bindir and libdir, one copy is sufficient)
      find "${pkgdir}/usr/${_arch}/lib" -maxdepth 1 -name "*.dll" -exec rm {} \;

      # create symlinks for tools
      mkdir -p "${pkgdir}/usr/bin"
      for tool in qmake moc rcc uic qdbuscpp2xml qdbusxml2cpp qdoc syncqt.pl; do
        ln -s "../${_arch}/lib/qt/bin/${tool}" "${pkgdir}/usr/bin/${_arch}-${tool}-qt5"
      done
    fi

    # drop QMAKE_PRL_BUILD_DIR because reference the build dir
    find "${pkgdir}/usr/${_arch}/lib" -type f -name '*.prl' -exec sed -i -e '/^QMAKE_PRL_BUILD_DIR/d' {} \;

    # remove doc
    rm -rf "${pkgdir}/usr/${_arch}/share/doc"

    # remove prl files for debug version
    if ! [[ $MINGW_W64_QT_DEBUG_BUILD ]]; then
      for file in $(find "${pkgdir}/usr/${_arch}" -name '*d.prl' -o -name '*d.static.prl'); do
        [ -f "${file%d*}${file##*d}" ] && rm "${file}";
      done
    fi

    # replace library path in *.prl files so it points to the installed location and not the build directory
    find "${pkgdir}/usr/${_arch}/lib" \( -type f -name '*.prl' -o -name '*.pc' \) -exec sed -i -e "s:${PWD%/*}/build-${_arch}/lib:/usr/${_arch}/lib:g" {} \;

    # strip binaries, remove unuseful files
    if ! isStatic; then
      strip --strip-all "${pkgdir}/usr/${_arch}/lib/qt/bin/"*[!.pl]
      strip --strip-unneeded "${pkgdir}/usr/${_arch}/lib/libQt5Bootstrap"{,DBus}.so.${pkgver}
    fi
    if isStatic || [[ $NO_EXECUTABLES ]]; then
      find "${pkgdir}/usr/${_arch}" -name '*.exe' -delete
    else
      find "${pkgdir}/usr/${_arch}" -name '*.exe' -exec ${_arch}-strip --strip-all {} \;
    fi
    find "${pkgdir}/usr/${_arch}" \( -name '*.bat' -o -name '*.def' -o -name '*.exp' \) -delete
    find "${pkgdir}/usr/${_arch}" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
    find "${pkgdir}/usr/${_arch}" \( -name '*.a' -not -name 'libQt5QmlDevTools.a' -not -name 'libQt5Bootstrap.a' \) -exec ${_arch}-strip -g {} \;
  done
}

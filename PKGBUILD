# Maintainer: Martchus <martchus@gmx.net>
# Contributor: ant32 <antreimer@gmail.com>
# Contributor: Filip Brcic <brcha@gna.org>
# Contributor: jellysheep <max.mail@dameweb.de>

# BEFORE COMMENTING OR REPORING ISSUES, PLEASE READ THE FILE `README.md` IN THIS REPOSITORY.
# ALSO HAVE A LOOK AT THE COMMENTS IN THE AUR.

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

# All patches are managed at https://github.com/Martchus/qtbase

# define helper functions for the split builds
isDefault() {
  [[ $pkgname = 'mingw-w64-qt5-base' ]] || [[ $pkgname = 'mingw-w64-qt5-base-static' ]]
}
isStatic() {
  [ "${pkgname##*-}" = 'static' ]
}
isOpenGL() {
  isDefault || [[ $pkgname = 'mingw-w64-qt5-base-opengl' ]] || [[ $pkgname = 'mingw-w64-qt5-base-opengl-static' ]]
}
isANGLE() {
  [[ $pkgname = 'mingw-w64-qt5-base-angle' ]] || [[ $pkgname = 'mingw-w64-qt5-base-angle-static' ]]
}
isDynamic() {
  [[ $pkgname = 'mingw-w64-qt5-base-dynamic' ]] || [[ $pkgname = 'mingw-w64-qt5-base-dynamic-static' ]]
}
isNoOpenGL() {
  [[ $pkgname = 'mingw-w64-qt5-base-noopengl' ]] || [[ $pkgname = 'mingw-w64-qt5-base-noopengl-static' ]]
}

pkgname=mingw-w64-qt5-base-angle
pkgver=5.13.2
pkgrel=1
pkgdesc='A cross-platform application and UI framework (mingw-w64)'
# The static variant doesn't contain any executables which need to be executed on the build machine
isStatic && arch=('any') || arch=('i686' 'x86_64')
url='https://www.qt.io/'
license=('GPL3' 'LGPL3' 'FDL' 'custom')
depends=('mingw-w64-crt' 'mingw-w64-zlib' 'mingw-w64-libjpeg-turbo' 'mingw-w64-sqlite'
         'mingw-w64-libpng' 'mingw-w64-openssl' 'mingw-w64-dbus' 'mingw-w64-harfbuzz'
         'mingw-w64-pcre2')
groups=('mingw-w64-qt5')
optdepends=('mingw-w64-mesa: use LLVMpipe software rasterizer for Qt Quick'
            'mingw-w64-postgresql: PostgreSQL support'
            'mingw-w64-mariadb-connector-c: MySQL support')
makedepends=('mingw-w64-gcc' 'mingw-w64-postgresql' 'mingw-w64-mariadb-connector-c'
             'mingw-w64-vulkan-headers' 'mingw-w64-pkg-config')
# For running fxc.exe WINE coulde be used:
#if isANGLE || isDynamic; then
#    makedepends+=('mingw-w64-wine')
#fi
options=('!strip' '!buildflags' 'staticlibs' '!emptydirs')
_pkgfqn="qtbase-everywhere-src-${pkgver}"
source=("https://download.qt.io/official_releases/qt/${pkgver%.*}/${pkgver}/submodules/${_pkgfqn}.tar.xz"
        '0001-Adjust-win32-g-profile-for-cross-compilation-with-mi.patch'
        '0002-Ensure-GLdouble-is-defined-when-using-dynamic-OpenGL.patch'
        '0003-Fix-too-many-sections-assemler-error-in-OpenGL-facto.patch'
        '0004-Make-sure-.pc-files-are-installed-correctly.patch'
        '0005-Don-t-add-resource-files-to-LIBS-parameter.patch'
        '0006-Prevent-debug-library-names-in-pkg-config-files.patch'
        '0007-Fix-linking-against-shared-static-libpng.patch'
        '0008-Fix-linking-against-static-D-Bus.patch'
        '0009-Don-t-try-to-use-debug-version-of-D-Bus-library.patch'
        '0010-Fix-linking-against-static-freetype2.patch'
        '0011-Fix-linking-against-static-harfbuzz.patch'
        '0012-Fix-linking-against-static-pcre.patch'
        '0013-Fix-linking-against-shared-static-MariaDB.patch'
        '0014-Fix-linking-against-shared-static-PostgreSQL.patch'
        '0015-Rename-qtmain-to-qt5main.patch'
        '0016-Enable-rpath-for-build-tools.patch'
        '0017-Use-system-zlib-for-build-tools.patch'
        '0018-Merge-shared-and-static-library-trees.patch'
        '0019-Use-.dll.a-as-import-lib-extension.patch'
        '0020-Pull-dependencies-of-static-libraries-in-CMake-modul.patch'
        '0021-Allow-usage-of-static-version-with-CMake.patch'
        '0022-Adjust-linker-flags-for-static-build-with-cmake-ming.patch'
        '0023-Use-correct-pkg-config-static-flag.patch'
        '0024-Fix-macro-invoking-moc-rcc-and-uic.patch'
        '0025-Ignore-errors-about-missing-feature-static.patch'
        '0026-Enable-and-fix-use-of-iconv.patch'
        '0027-Ignore-failing-pkg-config-test.patch'
        '0028-Prevent-qmake-from-messing-static-lib-dependencies.patch'
        '0029-Hardcode-linker-flags-for-platform-plugins.patch'
        '0030-Fix-linking-against-static-plugins-with-qmake.patch'
        '0031-Prevent-static-build-to-prefer-dynamic-libraries.patch'
        '0032-Prevent-Cannot-find-feature-windows_vulkan_sdk.patch')
sha256sums=('26b6b686d66a7ad28eaca349e55e2894e5a735f3831e45f2049e93b1daa92121'
            '35196184205cb58bdb1ade09c02bfc660679ed4af6dc1d807a24f1c52999545e'
            '4c66ecd2e2e215afb7f53382139b5a3a9cc87bfec2dd75af3ab8111ce3556378'
            'dcc5acb3e160b99101b967bd696dd48a099c65754b3908c16b46c1703f134e08'
            '586bea4aa870423778eb497df48479819aa50de8d07977327eb1a0f84565813a'
            'b5363b325198c3cfaba6437d21cc2cde6c5843d33475fc559f9eae4b20e0c867'
            '9f835025a78ab4d7dd08b1a2cb5d499790b8e01a3039741f50c93bc6722f3c71'
            '5217bae23859289898060a05769cc6088852f09206d7fc681cdcb492353be219'
            '39d32e743984904c878616afb8ffd16ad5421bc2e67606831a4245b9ef924c7b'
            'f5fc4b36f288bb59d662c58b49a15de84f60be05d13e89719342893138f9a903'
            '48f5efe578913656ab79a35f899e15bd09fde58cc10adf8f7f5dbdc0a5022b7d'
            'f89779100c07431fee063e0f40bcb0006662794afa522e9c5a57ac1eca24f621'
            'f5ea9cc35754556045dd2dc07745bca89f677ade9b8566539c717d35f4ae0bd1'
            '212aeb8f2f287108d2d884c17c2f55177b8f3c39e10357e36c2f1ef2e582a12a'
            '2e7145b8a8fca349ce5838d4241d29059dd421c8722260cda5d063b75ffe3b5f'
            'c0eff682bbc11e2258c5c40591d0222e88af0d2c136b3cede8e4792a7efba2d3'
            '8d3879a05e0fe574671bb8952393a4e7ca44183e8116053dbf01776b2d6ad4cf'
            '8b06afd5adab795a47520f1dfdb8827507f8d451eb98a02dbf1b57ede08fa6e2'
            '21f7e13919ec7d6ae88835ce34185f7d3ff3c541a1a7bad25e4354fac0201723'
            '5e08c43b1a4bfc1dfe93330119cfb85d5de873b8642cbf920d4cfbdad05a7ce5'
            'ee0412e276bac12f57f1019807f678818cc3b166afaa2523e6d3cfbcc6baf5bf'
            'f5f57e3b1e6314203bb3a98d7ad47c46b4894651b7d4e74749df6b7f0f7548f5'
            '22bdbef1d761426c0388a5335c2b80be52aa75e83c75f1d134eba70091de59ed'
            'fd37d3c487790922e6dede40964d6a8abab9908d674413748c37672863374a65'
            '1c4b6e6bbc985b742e4d2124b7be002948b2cb43be4524b8b713253f2afebe96'
            '94de3861dedd76133bd3e42793f3db3a1e8b52a921095ff853038cb5b4064a5f'
            'cd4c07f83cad7b8b1fb2995a398a3ac2ed9b4606efc0154231821db7f793676c'
            'b15f3a0d0dd1c14c5728444ad449f2753f6c668e73e6e2ad0477fab405c338e9'
            '45af95f6f2e228f04ee3e39756cf752a04a0e58da5ed445ab79dbac0c8c7472f'
            '29ded7cd3b82e31660d4559f0d2cefde8e18af8c4cea34fd816096946ad72189'
            '13aa6ba82a4a28099c0219060deab3d3023424a8c5dcf8df6b105f3831a9a184'
            '095a39a517844a3c3ce9282a44f39478dc6d5661b6be7f5b8517f195f0fe1b14'
            'f8aa4f1a129d0fd98f71e9a108513ff9ca78b3d86a80554e830cf6f1ba5edb00')

_architectures='i686-w64-mingw32 x86_64-w64-mingw32'

isStatic && depends+=(${pkgname%-static})

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
  #rm -rf src/3rdparty/angle include/QtANGLE/{EGL,GLES2,GLES3,KHR}

  # make sure the Qt 5 build system uses our external PCRE library and zlib
  rm -rf src/3rdparty/{pcre,zlib}

  # build qmake using mingw-w64 {C,LD}FLAGS
  # This also sets default {C,CXX,LD}FLAGS for projects built using qmake
  CPPFLAGS="${MINGW_CPPFLAGS:--D_FORTIFY_SOURCE=2}"
  CFLAGS="${MINGW_CFLAGS:-$CPPFLAGS -O2 -pipe -fno-plt -fexceptions --param=ssp-buffer-size=4}"
  CXXFLAGS="${MINGW_CXXFLAGS:-$CPPFLAGS -O2 -pipe -fno-plt -fexceptions --param=ssp-buffer-size=4}"
  LDFLAGS="${MINGW_LDFLAGS:--Wl,-O1,--sort-common,--as-needed}"
  sed -i -e "s|^\(QMAKE_CFLAGS_RELEASE.*=\).*$|\1 ${CFLAGS}|" \
         -e "s|^\(QMAKE_CXXFLAGS_RELEASE.*=\).*$|\1 ${CXXFLAGS}|" \
         -e "s|^\(QMAKE_LFLAGS_RELEASE.*=\).*$|\1 ${LDFLAGS}|" \
    mkspecs/common/gcc-base.conf
  sed -i -e "s|^\(QMAKE_LFLAGS_RELEASE.*=\).*$|\1|" \
    mkspecs/common/g++-unix.conf
}

build() {
  cd "${srcdir}/${_pkgfqn}"

  # do not set any flags here, flags are configured via mkspec
  # (Setting flags here is not appropriate as it does not allow to
  #  distinguish between flags for native compiler and cross compiler.
  #  See prepare() function.)
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
    qt_configure_args+=' -device-option CROSS_COMPILE_CXXFLAGS=-fpch-preprocess'

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
      # FIXME: This is broken because we needed to invoke fxc.exe (Direct3D Shader Compiler)
      #        during the build. Maybe start it with WINE?
      msg2 'Using ANGLE as OpenGL backend'
      qt_configure_args+=' -angle'
      # enable declarations of GLES functions
      # FIXME: Still required?
      qt_configure_args+=' -DGL_GLEXT_PROTOTYPES'
    elif isDynamic; then
      # FIXME: This is broken because is requires enabling the (bundled) ANGLE which is
      #        broken (see comment under isANGLE).
      msg2 'Using dynamic OpenGL backend'
      qt_configure_args+=' -opengl dynamic'
      qt_configure_args+=' -angle'
      # enable declarations of GLES functions
      # FIXME: Still required?
      qt_configure_args+=' -DGL_GLEXT_PROTOTYPES'
    fi

    # add include directory of MariaDB
    qt_configure_args+=" -I/usr/${_arch}/include/mariadb"

    # add include directory for Vulkan
    export VULKAN_SDK=/usr/${_arch}

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
      #export LD_LIBRARY_PATH="$PWD/lib"
      #export LDFLAGS="-L$PWD/lib"
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
        "${pkgdir}/usr/${_arch}/lib/"{lib,}Qt5VulkanSupport* \
        "${pkgdir}/usr/${_arch}/lib/"libQt5Bootstrap* \
      rm -r \
        "${pkgdir}/usr/${_arch}/lib/cmake/StaticQt5AccessibilitySupport" \
        "${pkgdir}/usr/${_arch}/lib/cmake/StaticQt5DeviceDiscoverySupport" \
        "${pkgdir}/usr/${_arch}/lib/cmake/StaticQt5EdidSupport" \
        "${pkgdir}/usr/${_arch}/lib/cmake/StaticQt5EventDispatcherSupport" \
        "${pkgdir}/usr/${_arch}/lib/cmake/StaticQt5FbSupport" \
        "${pkgdir}/usr/${_arch}/lib/cmake/StaticQt5FontDatabaseSupport" \
        "${pkgdir}/usr/${_arch}/lib/cmake/StaticQt5PlatformCompositorSupport" \
        "${pkgdir}/usr/${_arch}/lib/cmake/StaticQt5ThemeSupport" \
        "${pkgdir}/usr/${_arch}/lib/cmake/StaticQt5WindowsUIAutomationSupport" \
        "${pkgdir}/usr/${_arch}/lib/cmake/StaticQt5VulkanSupport" \
        "${pkgdir}/usr/${_arch}/lib/cmake/StaticQt5Bootstrap" \
        "${pkgdir}/usr/${_arch}/lib/cmake/StaticQt5BootstrapDBus"

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
      mv "${pkgdir}/usr/${_arch}/lib/qt/mkspecs/qdevice.static.pri" "${pkgdir}/usr/${_arch}"
      mv "${pkgdir}/usr/${_arch}/lib/qt/mkspecs/modules/qt_plugin_"*.pri "${pkgdir}/usr/${_arch}"

      # fix bad library order for static CMake builds caused by Qt5Gui.static.prl
      sed -i -e "s|-lfreetype;|-lfreetype;-lharfbuzz;-lfreetype;-lbz2;|" \
             -e "s| -lz;| |" \
                "${pkgdir}/usr/${_arch}/lib/Qt5Gui.static.prl"

      # delete duplicate files that are in the base package
      rm -fR "${pkgdir}/usr/${_arch}/"{include,share}
      rm -fR "${pkgdir}/usr/${_arch}/lib/"{qt/bin,qt/mkspecs}

      # move pri files back
      mkdir -p "${pkgdir}/usr/${_arch}/lib/qt/mkspecs/modules"
      mv "${pkgdir}/usr/${_arch}/qdevice.static.pri" "${pkgdir}/usr/${_arch}/lib/qt/mkspecs"
      mv "${pkgdir}/usr/${_arch}/"*.pri "${pkgdir}/usr/${_arch}/lib/qt/mkspecs/modules"

    else # shared version
      # remove DLLs from libdir (DLLs are installed in both bindir and libdir, one copy is sufficient)
      find "${pkgdir}/usr/${_arch}/lib" -maxdepth 1 -name "*.dll" -exec rm {} \;

      # install missing libQt5BootstrapDBus.a manually
      cp --target-directory "${pkgdir}/usr/${_arch}/lib" "$srcdir/build-${_arch}/lib/libQt5BootstrapDBus.a"

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

    # remove '.static.prl' files
    find "${pkgdir}/usr/${_arch}" -name '.static.prl' -delete

    # replace library path in *.prl files so it points to the installed location and not the build directory
    find "${pkgdir}/usr/${_arch}/lib" \( -type f -name '*.prl' -o -name '*.pc' \) -exec sed -i -e "s:${PWD%/*}/build-${_arch}/lib:/usr/${_arch}/lib:g" {} \;

    # strip binaries, remove unuseful files
    if ! isStatic; then
      strip --strip-all "${pkgdir}/usr/${_arch}/lib/qt/bin/"*[!.pl]
      strip --strip-debug "${pkgdir}/usr/${_arch}/lib/libQt5Bootstrap"*.a
      #strip --strip-unneeded "${pkgdir}/usr/${_arch}/lib/libQt5Bootstrap"{,DBus}.so.${pkgver}
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

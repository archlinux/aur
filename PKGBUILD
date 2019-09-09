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

pkgname=mingw-w64-qt5-base-static
pkgver=5.13.1
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
        '0031-Disable-hardware-randomizer-for-32-bit.patch'
        '0032-Prevent-static-build-to-prefer-dynamic-libraries.patch'
        '0033-Prevent-Cannot-find-feature-windows_vulkan_sdk.patch')
sha256sums=('110cd08cdacab26274bf2519d3508046616c0b638f0d2f5e00bc8bad87469eab'
            '52f473398f93d9446a22ddd806d70ed3c530e4592013b0070f55fa6cb5dd024f'
            'a88f6a3246993a46ddda334f0b0a0f8969be3a4420fff17fe810399ab709fd4a'
            'da99200b82fd866b950de2fc5a0e633af12cce1b86168fdb5d91a269437af80c'
            'd1c962fdcf6974da877c6c94083f9a4c32b3565faa09b92fe4045df97add7fc2'
            '704bf70f29fcd19863fdb0d1a5be62b4fa9de9c8e0bdc5b9cea4a7ed2def0908'
            '560c2ad8dc492cd512da18ec66f5dd28892b589810f0e1de436a5e94fd28a52c'
            'b106f03cc8976ece37cbd3095707ae6d6e41b62e90d0ae6d34f96ebd8eb62a5a'
            'acaa96d5354c4c7bac6009a78e276b2f756c5557fb9016449af983f5cac896b1'
            'dc2ee63858c9b8e46a065fb430fb4563448e3d5b493c425939085c3290e1987d'
            'cddf9ff3f26661142fe9f895fde0ab587639b4bb8d6279e8de2e201e6f637cbf'
            'd9271e94b596bfdc2901af1ebd8a8284ef421e7a99d46dd3c65daed8a121d6d2'
            'f073aaf27b8b089cff3d3f54bec0e38229deaa999aff2dcc203656f8b7994cb6'
            'f6ef098372e051e234d979bd5f5467b81d89b2f803d4316f64564e16e12cbb52'
            'b001fc1b29d6b3db975d417d1ad9746fd0cabd7692b12a35d473399951f75111'
            'f9dda213747f49c13414a89a5ac3a57064a06798e92106cc3f2f227d5674450d'
            'a49459c9ed2a7fc29a82a94ab43459ff510c6763da73da46ccae5d51ff1f16bc'
            'e25f22a835b9e8ad12aa869222259024fff3d26bf9fe05ce4cc8d0f2f6f4a5e6'
            '9940d363b3f8dc10b0151845711ba445c98e850c9fe413f52abb7f8c84eb9b50'
            'd068d378b108ebe4dc645a7cacb89c69acd6b06346bcb0b47563e8cdb9f60c46'
            'e1d4f534beb22b08cc9b70163a871281723aff19a14911f25f522c2a31de944e'
            'e7584630ea69fc8c4e937106268cbf38258550cb26d33a6a38feea0a71aa6edc'
            '6193e9b1baa63819dca331f9a62a483c50150ee0fb64e1199b0c1fd3c6388ac3'
            '473101992df6f30fb50b2a0be45e55f2391021c01bc2bdf6a97fd7d3067f8fe6'
            '809214ea4afccba045c7dd41902b160cf5ec7e4a501457b79b0f51def73e6de4'
            '565a7b7aa93c8fd57cc4e6da69246110cce82663718078b8d08952a2c4038aac'
            'a4347a60524b83a77c82aaa0502d8561dc9fb8012d676073a4211100404309ad'
            '392608b8d6cf513f4e67ef1748e0b92e33808a16670db6346974ebc62977f762'
            'b74e5960f131866c3fb74fc756da9574e0d03227044a8b80ad7ad6716777035c'
            '9dd9393ea601eee07b23222278369909291f1077ea7a14a790260f7b7a8da4c3'
            '6ac3bf6b0c447804f8a3b2acebe7e432e2f2dfc6180501ff1a96d0174e4edbe8'
            '5c37923453bc13b06a37f9e916883516c83fdcd3dcae893beb97d2b52e6b77df'
            '536cd9405a0a7a825768388f9e761e8c257e7e6e64406c9a3cce3c9cf1f48474'
            'a0e20cc3bc60f9b7a3a7281b2f778362ce7cdb16d89478039f1c76896b3383bf')

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

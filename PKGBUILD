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

pkgname=mingw-w64-qt5-base-static
pkgver=5.11.2
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
sha256sums=('6381e7c3468d5a1dcfe3683b29eeced192faa0f8a32434fec071a59b8bcd0107'
            '3036fb04baa54d010dce053059dd780322f1d2925d42bdb6d9762539b1581e62'
            '0861dc21d857eeddbc992f63f66590baade93e049b1ea385a34b8896e231cbd0'
            'cff8b6b146bc20faaa1f7dc25e88f6f3dd71657d2b80d5b3b15c0949026fc4aa'
            '76ea9cd3ab0d9308fb57bff0bd82490ec3da95e3e5f96d452fe62206daff300d'
            '626790dc110b0c70989e57dbdb42dd1cc5757c2360d6e7714624fbdee6e8dae1'
            '96d94a7aae914f3706a820ad074bbd32e884154c1bebba3f3e631920fe0fbd59'
            '6bbdf39b2682002d4f4972b395f49d17acee607f92df00734faf53c4930de2d9'
            '3c1df53016e40b00dbe8ef132b50730fadf412534135a114628612f4c55fe6b7'
            '02966be361050075382e3a3ad83e4eb13d7b135aadb95d43b2bde443c39506aa'
            '230e4bf22051a79d36285178c8e294e479e81a5480d8791b53ab090a87b8d5e7'
            '7f6a16f8d2108bc96b58a1fcb695da342f71bd47de24f5b20b9412319e4e35ad'
            '49a6571dca2333c04658f47e7f0971ffaa45d8c8664cc7dded63d8f29b80bfb2'
            '32333bd89e86efba6333897f77dbd61464ea8130013248b37c5927eb3c79efdc'
            '4b7c018cc7335639df7b3819132d5d32906a5fa0796c2caf4428993f16697882'
            'a6086ef73d1b2ac079b06f2ce1059458af1f033efa7a2e5e684c97d64d418296'
            '82787b2bac35de3992bb36816ee0bd30117a3e8679d0cffc2aabe7c551c5f4cb'
            'dcee7f38ce40aec00e8ecce72b9a3c07e6d0bf838049c4bbb80f33448e34038b'
            '49b332039ef6ba074c58fd7149df70003a7e69c61ed1519df6a0f16635848843'
            'c345fd741f71c9e728ea88e4c86640c522d7cc0c9f0e39cee5812a2ea41c51e5'
            '55ffc1bc12d449cb80fa5be4891e4ebdba4a41c62a5953b13dfc8fb75c153de4'
            'af990f18952df3372f42112f68f13ceab9a46feb50c115ea548b44822b841e29'
            '843e78560e7d09b86979f928e16d1ed56595d6f660d4dc95d4888a56978b9d43'
            'c8fc2495f4d99d460020c362dbf78e6faba2c60c65580f8d06f59fe6e85d7e19'
            '0be553d337ecc23b1a1bc8df019beaa300b3e0d0bffa8d68e6401f5cbfa79b21'
            '03ff8e2ca617a5852ce9b0c99eab6c5866e00c5099e62e4c583af6e68b03c076'
            '3e6d0ed72cf9817dd7508b5403c1bbbdde91f6a59725c8e5250abe8fc66b5a03'
            '16fd7e1dc7afb830d984b1d6c112c632e4190f610cdee48d36bd0313e1c19634'
            'd28476f714a02671acaa02ce0c3a462efd2917aa02d9add004e1d5935f795e76'
            '4cbaddd05144010a681d370573d98130af909adedbc761728d0842af3be84a1d'
            '9bf58d9378fcdd5a1af5e272f2ef19c3b2ec6b020bcb2b78ec808e7adcc8f032'
            'ca1b066b22af17192b59ce7f0ca3a83bda7c6a8c7f023537c37c1b5c4a388984'
            'd33e97f491ec8773922ccdd9df25ef3f532c00edf48bab858cef99a60edcf8fe'
            '550082fea34c12c9df92c73ac1c7ae23ee7ef454799403fda0d495f5d8d92be4')

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

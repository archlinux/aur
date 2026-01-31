# Maintainer: Martchus <martchus@gmx.net>
# Based on: AUR packages qt6-base-git and mingw-w64-qt6-base-git, official qt5-base package

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

# This file is created from PKGBUILD.sh.ep contained by the mentioned repository.
# Do not edit it manually! See README.md in the repository's root directory
# for more information.

# All patches are managed at https://github.com/Martchus/qtbase

pkgname=mingw-w64-qt6-base
_qtver=6.10.2
pkgver=${_qtver/-/}
pkgrel=1
arch=(any)
url='https://www.qt.io'
license=(GPL-3.0-only
         LGPL-3.0-only
         LicenseRef-Qt-Commercial
         Qt-GPL-exception-1.0)
pkgdesc='A cross-platform application and UI framework (mingw-w64)'
depends=('mingw-w64-crt' 'mingw-w64-cppwinrt' 'mingw-w64-zlib' 'mingw-w64-libjpeg-turbo' 'mingw-w64-sqlite'
         'mingw-w64-libpng' 'mingw-w64-openssl' 'mingw-w64-dbus' 'mingw-w64-harfbuzz'
         'mingw-w64-brotli' 'mingw-w64-pcre2' 'mingw-w64-zstd')
makedepends=('qt6-base' 'ninja' 'mingw-w64-cmake'
             'mingw-w64-vulkan-headers' 'mingw-w64-vulkan-icd-loader' 'mingw-w64-pkg-config')
optdepends=('qt6-base: development tools')
options=('!strip' '!buildflags' 'staticlibs' '!emptydirs')
if ! [[ $pkgname =~ .*-clang-.* ]]; then
  makedepends+=('mingw-w64-postgresql' 'mingw-w64-mariadb-connector-c')
  optdepends+=('mingw-w64-postgresql: PostgreSQL driver'
               'mingw-w64-mariadb-connector-c: MariaDB driver')
fi
groups=(mingw-w64-qt6)
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
        '0013-Workaround-Unknown-CMake-command-_qt_test_emscripten.patch'
        '0014-Fix-configuration-when-EMSCRIPTEN_ROOT-is-an-absolut.patch'
        '0015-Allow-keeping-Android-app-in-background-with-QtQuick.patch'
        '0016-Enable-minimal-and-offscreen-plugins-when-compiling-.patch'
        '0017-Allow-configuring-use-of-OpenSSL-in-QPasswordDigesto.patch'
        '0018-Drop-CMAKE_SYSTEM_VERSION-from-modules-json-if-Linux.patch'
        '0019-Workaround-linker-error-about-missing-symbol-__sync_.patch'
        '0020-Fix-Android-build-after-ec2e3e7ac92d000e0df0c693b9a6.patch'
        '0021-Fix-inclusion-of-OpenGL-header-after-Qt-6-header.patch'
        '0022-Use-a-more-reasonable-fallback-directory-for-fonts-o.patch'
        '0023-Undefine-mingw-stat.patch'
        '0024-Export-some-constexpr-variables.patch')
sha256sums=('aeb78d29291a2b5fd53cb55950f8f5065b4978c25fb1d77f627d695ab9adf21e'
            '4e3664deeed9cad5a36b3a0c8a424666f15761b27edeb7c1d88d9e8c6180e4cd'
            'e4fb252c8411057d78d8a9db99535213342f3d014775905c5873ee9adb289b51'
            'e8a9751153224b4c3ebbe44b9c915384deaad323647c05f766da6b573493fedc'
            'cce050a3beaaab45ebcd280efd360fecb1218893d05d324f5640dc73b5dfe669'
            'c91ad27e0608b6ceeb41772055ac301c04231f38150eb5a77d34c8324377e373'
            'b5f3b11db1795502d9df739f9ce70919950ef28348340ee76feb19685454cbc4'
            '078a10549fb30d66e2506a1694783dc238467cdf7ee41aeb3d2e3d28f0ac7898'
            '193a246d06a3eb1fc74b8516bd682e2e73da9c6d39b10acf937c424df1ce9035'
            '30b9ef3e9eaa7159fb05958a2f1bdb88a492a7064175f0f2a4eba0992327afe4'
            '159f8fee1c3a199f2bdd72eb893ba4271c3b0149a34e8c45bfab0def55d1f3c5'
            'e9115b33492d3bbeebbd7e27861e438a7ed5b7849c5a56c9c43c273178c87391'
            'c19e24db24b1759907a0fb8b68dc0b204e1489b7d4b164b93330684fb28be404'
            '218a9d341f3f1fce5beb648be907fb168cd8550c6f34b7d90da3f9e3c054df8b'
            '19beffb348ea93463e84d8f5c738268eac560a3dc4a35a31651e252b0c218ca9'
            'eabd7e2e1333aba95f1b9ce840338b89a393c86f007b3a50453d036dc7a7bbef'
            '6a205d48f669b28f527ba8e2d2f4e67c544f6a02c16589482d2b2b824198df6b'
            'fbf25d0ff91ae30b95fbacb9c354997a51c4d2dd1c5d32263c541e56ba807133'
            'b70ae6aa150462a60af383994e23a74cba192452b675c313882a04601de19cdd'
            '13b6e54998864d0667c39e66076a1f9fb23a7fbcc84a5c1df0f6a05c578399bd'
            'a36d753b93690f52b523d99b055c032d3686ed2b0c8d73def315b6e2e8a0a0ee'
            '9c0c7f03791ea6144a3ba8da955423a270757020894ca4b63f8df6238180ebbd'
            '4f93ddcd38f0d2f4ee240e555841aab6857cbaecce4b1999bc51cc1417a5ccc1'
            '23c584af4d6b2bd776f894930efa8fa7b46deae67c65e0bbbfaff036253efe4f'
            '8c34f996f6915fda316ed2bb6253b4595c171236195076a5c211ad6b0e54178a')

# disable i686 build because 32-bit Windows is generally not supported by upstream and
# it does not build anymore as of GCC 14 (probably due to commit 9a19fa8b616f83474c35cc5b34a3865073ced829)
# remarks:
# - This is in-line with MSYS2's packaging of mingw-w64 Qt 6 packages.
# - You may override MINGW_W64_QT6_ARCHS by adding the variable to `/etc/makepkg.conf` in case you
#   nevertheless want to attempt the i686 build.
_architectures=${MINGW_W64_QT6_ARCHS:-x86_64-w64-mingw32}

prepare () {
  cd $_pkgfqn

  # apply patches; further descriptions can be found in patch files itself
  for patch in "$srcdir/"*.patch; do
    msg2 "Applying patch $patch"
    patch -p1 -i "$patch"
  done
}

build() {
  for _arch in ${_architectures}; do
    export PKG_CONFIG=/usr/bin/$_arch-pkg-config

    # workaround https://gcc.gnu.org/bugzilla/show_bug.cgi?id=120495
    [[ $pkgname =~ .*-clang-.* ]] || export CXXFLAGS+=' -Wno-template-body -fcoroutines'

    local _enable_winrt_support=ON
    if [[ ! -e /usr/${_arch}/include/winrt/Windows.Foundation.h ]]; then
      echo "cppwinrt headers seem incomplete, disabling FEATURE_cpp_winrt"
      _enable_winrt_support=OFF
    fi

    # workaround hangs on startup when compiling with LLVM/Clang/libc++
    local additional_flags=()
    if [[ $pkgname =~ .*-clang-.* ]]; then
      # the culprit seems to be fortifying sources which has to be disabled completely (setting to 1 or 2 does
      # not help)
      additional_flags+=(
        -DCMAKE_C_FLAGS="${CFLAGS//-D_FORTIFY_SOURCE=3/}"
        -DCMAKE_CXX_FLAGS="${CXXFLAGS//-D_FORTIFY_SOURCE=3/}"
      )
    fi

    $_arch-cmake -G Ninja -B build-$_arch -S $_pkgfqn \
      -DFEATURE_cxx20=ON \
      -DFEATURE_cpp_winrt=$_enable_winrt_support \
      -DFEATURE_pkg_config=ON \
      -DFEATURE_system_pcre2=ON \
      -DFEATURE_system_freetype=ON \
      -DFEATURE_system_harfbuzz=ON \
      -DFEATURE_system_sqlite=ON \
      -DINSTALL_BINDIR=lib/qt6/bin \
      -DINSTALL_DOCDIR=share/doc/qt6 \
      -DINSTALL_ARCHDATADIR=lib/qt6 \
      -DINSTALL_DATADIR=share/qt6 \
      -DINSTALL_INCLUDEDIR=include/qt6 \
      -DINSTALL_MKSPECSDIR=lib/qt6/mkspecs \
      -DINSTALL_EXAMPLESDIR=share/doc/qt6/examples \
      -DQT_NO_PACKAGE_VERSION_CHECK:BOOL=TRUE \
      -DINPUT_openssl=runtime \
      "${additional_flags[@]}"
    VERBOSE=1 cmake --build build-$_arch
  done
}

package() {
  for _arch in ${_architectures}; do
    DESTDIR="$pkgdir" cmake --install build-$_arch

    install -Dm644 $_pkgfqn/LICENSES/* -t "$pkgdir"/usr/share/licenses/$pkgname

    # Add symlinks of DLLs in usual bin directory
    mkdir -p "$pkgdir/usr/bin" "$pkgdir/usr/$_arch/bin"
    for dll in "$pkgdir"/usr/$_arch/lib/qt6/bin/*.dll; do
        ln -rs "$dll" "$pkgdir/usr/$_arch/bin/${dll##*/}"
    done

    # Symlinks for backwards compatibility
    for qmake; do
        ln -rs "$pkgdir"/usr/$_arch/lib/qt6/bin/$_b "$pkgdir"/usr/bin/$_arch-$_b-qt6
    done

    # Drop QMAKE_PRL_BUILD_DIR because reference the build dir
    find "$pkgdir/usr/$_arch/lib" -type f -name '*.prl' \
      -exec sed -i -e '/^QMAKE_PRL_BUILD_DIR/d' {} \;

    find "$pkgdir/usr/$_arch" -iname '*.exe' -exec $_arch-strip --strip-all {} \;
    find "$pkgdir/usr/$_arch" -iname '*.dll' -exec $_arch-strip --strip-unneeded {} \;
    find "$pkgdir/usr/$_arch" -iname '*.a'   -exec $_arch-strip -g {} \;
    [[ -d "$pkgdir/usr/$_arch/share/doc" ]] && rm -r "$pkgdir/usr/$_arch/share/doc"
  done
}

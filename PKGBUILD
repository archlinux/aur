# Maintainer: Andrew Munkres <amunkres@nyx.net>

pkgname=quickviewer
pkgver=1.1.8
pkgrel=2
pkgdesc="An image/comic viewer application"
arch=('i686' 'x86_64')
url="https://kanryu.github.io/quickviewer/"
license=('GPL3' 'custom:unrar')
# Warning: QuickViewer's Git repository imports (as submodules) the source code
# of some required 3rd-party libraries into QuickViewer's own source tree as
# Git submodules; and while some of these (such as expat, easyexif, and
# ResizeHalf) use GPL3-compatible licenses, at least one (unrar) uses a
# GPL3-incompatible license. Therefore, the compiled binary likely is not
# legally redistributable.
depends=('qt5-base')
makedepends=('git' 'qt5-tools')
source=("${pkgname}::git+https://github.com/kanryu/${pkgname}.git#tag=v${pkgver}"
        "ResizeHalf::git+https://github.com/chikuzen/ResizeHalf.git#commit=f1eb302317b2de5f8c1768db989c167c6f785822"
        "easyexif::git+https://github.com/mayanklahiri/easyexif.git#commit=19d15151c3f663813dc70cf9ff568d25ab6ff93b"
        "exiv2::git+https://github.com/Exiv2/exiv2.git#commit=fa449a4d2c58d63f0d75ff259f25683a98a44630"
        "libexpat::git+https://github.com/libexpat/libexpat.git#commit=56b64ca0406d31f0a8cd93e155c38a3b30b002f8"
        "luminor::git+https://github.com/kanryu/luminor.git#commit=c2d113b8a45f3c7118ded920277ca35583689d1c"
        "quazip::git+https://github.com/kanryu/quazip.git#commit=6cc7516f65f20e59739c629fe95a0eac7953260e"
        "zimg::git+https://github.com/sekrit-twc/zimg.git#commit=5e603b6390f0fc1e32e634dece083dd8b729334a"
        "zlib::git+https://github.com/madler/zlib.git#commit=cacf7f1d4e3d44d871b605da3b647f07d718623f"
        "qactionmanager::git+https://github.com/kanryu/qactionmanager.git#commit=2f66c030ef2169eccc240b10a10b7f921bd0cfea"
        "qfullscreenframe::git+https://github.com/kanryu/qfullscreenframe.git#commit=550f001f4383edaf5baf1598ad1473bc698f807a"
        "qlanguageselector::git+https://github.com/kanryu/qlanguageselector.git#commit=d0e5cb6141854c1eacb68d2dd31bf7cb9337a7ab"
        "qnamedpipe::git+https://github.com/kanryu/qnamedpipe.git#commit=f887aadb1b1587c82459e94ef3195c97a697ad05"
        "lib7zip::git+https://github.com/kanryu/lib7zip.git#commit=111768f3a72c1d2a8b184024e5be7c675156413f"
        "quickviewer-1.1.8-fix-nonwindows-filename-comparator.patch"
        "quickviewer-1.1.8-fix-nonwindows-64bit-type-mismatch.patch"
        "quickviewer-1.1.8-fix-p7zip-noninteger-type-problem.patch"
        "quickviewer-1.1.8-change-qmake-variable-defs.patch"
        "quickviewer-1.1.8-main-projectfile-changes.patch"
        "quickviewer-1.1.8-fileloader-projectfile-changes.patch"
        "quickviewer-1.1.8-lib7z-projectfile-changes.patch"
        "quickviewer-1.1.8-Qt7z-projectfile-changes.patch"
        "quickviewer-1.1.8-desktopfile-changes.patch"
        "quickviewer-1.1.8-fix-missing-c-stddef-include.patch"
        "quickviewer-1.1.8-fix-case-sensitivity-include-problem.patch"
        "quickviewer-1.1.8-fix-lib7zip-duplicate-function-problem.patch")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '8a2729a3bd5b6b8a5e9124593c881b98a20db7742b66d82641a40ee256faaeb4'
            '67e8581b92518e7b3f36ed3af89de3075f2d333b1c96818374a40c1f84e500d5'
            'a6700a1470ec2d34e10accc32a2ba7fd1afcbfc2431d0990e34b82c62cabf471'
            '17aaffcb0a8d812ac10d26b69b88163031e25b8144b5eb1ec65be96e33debace'
            'ce083a24eafe219293e66bea47cc8441e1f4250159effbbcbe6915c3ba1c6162'
            'e4c8dce65e7d7569aa48bf444c4afe5e882f40cf4854712ca86f24a6671fe2c0'
            '18b03a7f06d9cd4d5afbdc14f48caad5f065b212281984726e1c90bd48dbe5bd'
            'c90a69365b3885efcabbc7c16dc73e17d8377df411ff547659b4d820a411b66b'
            '7c73402e349afe235b1ddcc81f33f0d8272e9271a37cc583c30d71ceb09abe11'
            '1a40569ec5cf4e5025447874440f65a1da1281e0c75e95809a8f5686e70e5e9b'
            'e10f9ed1aa87370f4561a0a959c29d73774132a1dc3ac996c1bb1658b5954291'
            'ca5692130549c492f09cad46ec0b833324e62e9107946d1cd598e35d8af2afd7')

prepare() {
    cd ${pkgname}
    # Apply patch to fix non-Windows version of fileNameDescendingLessThan function:
    patch -Np1 -i ../quickviewer-1.1.8-fix-nonwindows-filename-comparator.patch
    # Apply patch to fix integer-type-mismatch bug on non-Windows 64-bit architectures:
    patch -Np1 -i ../quickviewer-1.1.8-fix-nonwindows-64bit-type-mismatch.patch
    # Apply patch to fix use of integer operators on a bool variable within p7zip source code:
    patch -Np1 -i ../quickviewer-1.1.8-fix-p7zip-noninteger-type-problem.patch
    # Apply patch to not build an AppImage, enable OpenGL, and adjust target pathname-prefix:
    patch -Np1 -i ../quickviewer-1.1.8-change-qmake-variable-defs.patch
    # Apply patch to install desktop and icon files, and change pathname for translations, etc.:
    patch -Np1 -i ../quickviewer-1.1.8-main-projectfile-changes.patch
    # Apply patches to have libraries build using qmake installed by their own qmake-projects,
    # and remove unwanted RPATH:
    patch -Np1 -i ../quickviewer-1.1.8-fileloader-projectfile-changes.patch
    patch -Np1 -i ../quickviewer-1.1.8-lib7z-projectfile-changes.patch
    # Apply patch to include lib7zip source files in Qt7z project file:
    patch -Np1 -i ../quickviewer-1.1.8-Qt7z-projectfile-changes.patch
    # Apply patch to fix the pathname in QuickViewer.desktop:
    patch -Np1 -i ../quickviewer-1.1.8-desktopfile-changes.patch
    # Checkout the Git submodules:
    git submodule init ResizeHalf/ResizeHalf easyexif/easyexif exiv2/exiv2 libexpat/libexpat \
    luminor/luminor quazip/quazip zimg/zimg zlib/zlib QuickViewer/src/qactionmanager \
    QuickViewer/src/qfullscreenframe QuickViewer/src/qlanguageselector QuickViewer/src/qnamedpipe \
    Qt7z/Qt7z/lib7zip
    git config submodule.ResizeHalf.url ${srcdir}/ResizeHalf
    git config submodule.easyexif.url ${srcdir}/easyexif
    git config submodule.exiv2.url ${srcdir}/exiv2
    git config submodule.libexpat.url ${srcdir}/libexpat
    git config submodule.luminor.url ${srcdir}/luminor
    git config submodule.quazip.url ${srcdir}/quazip
    git config submodule.zimg.url ${srcdir}/zimg
    git config submodule.zlib.url ${srcdir}/zlib
    git config submodule.qactionmanager.url ${srcdir}/qactionmanager
    git config submodule.qfullscreenframe.url ${srcdir}/qfullscreenframe
    git config submodule.qlanguageselector.url ${srcdir}/qlanguageselector
    git config submodule.qnamedpipe.url ${srcdir}/qnamedpipe
    git config submodule.lib7zip ${srcdir}/lib7zip
    git submodule update
    # Apply patch to fix missing "#include <stddef.h>" in zimg library
    patch -Np1 -i ../quickviewer-1.1.8-fix-missing-c-stddef-include.patch
    # Apply patch to fix case-mismatched "#include <InitGuid.h>" in lib7zip library
    patch -Np1 -i ../quickviewer-1.1.8-fix-case-sensitivity-include-problem.patch
    # Apply patch to fix duplicate copy of MyStringCompareNoCase function
    patch -Np1 -i ../quickviewer-1.1.8-fix-lib7zip-duplicate-function-problem.patch
}

build() {
    cd ${pkgname}
    qmake -o Makefile -recursive QVproject.pro
    make
    lrelease QuickViewer/translations/*.ts
}

package() {
    cd ${pkgname}
    make INSTALL_ROOT="${pkgdir}" install
}

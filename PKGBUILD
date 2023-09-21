# Maintainer:  Alexander <tx00100xt@yandex.ru>
# Contributer: Alexander <tx00100xt@yandex.ru>

pkgname=seriousrunner
pkginstdir=seriousrunner
pkgver=1.0
_srcname="Serious-Runner-$pkgver"
pkgrel=2
pkgdesc="Serious Runner program that loads and runs content created by users."
arch=('x86_64')
url="https://github.com/tx00100xt/Serious-Runner"
license=('GPL2')

makedepends=('cmake' 'make' 'sed' 'qt5-base' 'libarchive' 'xz' 'bzip2')
source=("https://github.com/tx00100xt/Serious-Runner/archive/refs/tags/v$pkgver.tar.gz"
	"0001-Fix_slotname_bug.patch"
	"0002-Update_Readme.md.patch"
	"0003-Fix_MainWindow.ui.patch"
	"0004-Fix_Inslall_Button_locked.patch"
	"0005-Set_ComboBox.patch"
	"0006-Update_CMakeLists.txt.patch"
	"0007-Fix_LibArchve_For_old_cmake.patch"
	"0008-Fix_MainWindow_slot_names.patch"
	"0009-Added_Themes_for_seriousrunner.patch"
)
sha256sums=('1e7d9d09c935204fbecdc5c33ea101dff8e6d87c8dc891d5cf529fdc95af7aad'
	'ccff402eaca26ecdaecc89c3a64696ae06f2a4c3bc51a51b8080e2f62c9a9ee2'
	'387545afecfe1ec1f90e10988fbddebfce3c49a657d11f10303a46c15e0c3b41'
	'9d9e4881270b7cc57f2b36bb045e956cd4bc5f73019d626e5a21e2585f6a7728'
	'24c3aabd4151ea56f5fcb313e6627bfb7ea1c2529ef8ac589c25f948fb7b9529'
	'e5d4533a1f983114f2394ae0dbd59ae5827d89e64208c9cfff96e1c96c99c292'
	'00129c3b4d74c2e7e43299c22f056d5476bb6637af969e71ef53523906e0f0fa'
	'026e8c6b3c2dd36f6dbf4e42c0d9ab5a566e7015e846e82bbeebeebe14728baa'
	'8b73c2f68eccc109ca04067dee028edb9a280f5e5a3f69ba063a81fa6bb8650d'
	'c649160cd265ad1572094abbc406c41568262bc8209dce81fc4fd49537fce21d'
)

prepare(){
  # Prepare patch
  cat 0001-Fix_slotname_bug.patch > "$srcdir/$_srcname/0001-Fix_slotname_bug.patch"
  cat 0002-Update_Readme.md.patch > "$srcdir/$_srcname/0002-Update_Readme.md.patch"
  cat 0003-Fix_MainWindow.ui.patch > "$srcdir/$_srcname/0003-Fix_MainWindow.ui.patch"
  cat 0004-Fix_Inslall_Button_locked.patch > "$srcdir/$_srcname/0004-Fix_Inslall_Button_locked.patch"
  cat 0005-Set_ComboBox.patch > "$srcdir/$_srcname/0005-Set_ComboBox.patch"
  cat 0006-Update_CMakeLists.txt.patch > "$srcdir/$_srcname/0006-Update_CMakeLists.txt.patch"
  cat 0007-Fix_LibArchve_For_old_cmake.patch > "$srcdir/$_srcname/0007-Fix_LibArchve_For_old_cmake.patch"
  cat 0008-Fix_MainWindow_slot_names.patch > "$srcdir/$_srcname/0008-Fix_MainWindow_slot_names.patch"
  cat 0009-Added_Themes_for_seriousrunner.patch > "$srcdir/$_srcname/0009-Added_Themes_for_seriousrunner.patch"

  cd "$srcdir/$_srcname"
  # apply patch
  patch -p1 < 0001-Fix_slotname_bug.patch || return 1
  patch -p1 < 0002-Update_Readme.md.patch || return 1
  patch -p1 < 0003-Fix_MainWindow.ui.patch || return 1
  patch -p1 < 0004-Fix_Inslall_Button_locked.patch || return 1
  patch -p1 < 0005-Set_ComboBox.patch || return 1
  patch -p1 < 0006-Update_CMakeLists.txt.patch || return 1
  patch -p1 < 0007-Fix_LibArchve_For_old_cmake.patch || return 1
  patch -p1 < 0008-Fix_MainWindow_slot_names.patch || return 1
  patch -p1 < 0009-Added_Themes_for_seriousrunner.patch || return 1
}

build() {
	mkdir "$_srcname"/build && cd "$_srcname"/build
    cmake  -DCMAKE_BUILD_TYPE='Release' \
           -DCMAKE_INSTALL_PREFIX='/usr' \
           -Wno-dev ..
	cd .. && cd ..
    cmake --build "$_srcname"/build
}

check() {
    ctest --test-dir "$_srcname"/build --output-on-failure
}

package() {
    DESTDIR="$pkgdir" cmake --install "$_srcname"/build
}

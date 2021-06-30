# Maintainer: Arnaud Dovi <mr.dovi@gmail.com>

pkgname=detect-it-easy-git
pkgver=3.02.r42.657afee
pkgrel=2
pkgdesc='Detect It Easy, or abbreviated "DIE" is a program for determining types of files'
arch=('x86_64')
url='https://horsicq.github.io'
license=(MIT)
provides=(
  'detect-it-easy'
)
conflicts=(
  'detect-it-easy'
)
depends=(
  'freetype2'
  'glib2'
  'glibc'
  'graphite'
  'icu'
  'krb5'
  'qt5-base'
  'qt5-script'
  'qt5-svg'
  'systemd-libs'
)
makedepends=(
  'coreutils'
  'git'
  'imagemagick'
  'qt5-tools'
)
_srcname="DIE-engine"
source=(
  'git+https://github.com/horsicq/DIE-engine.git'
  "${_srcname}/Controls::git+https://github.com/horsicq/Controls.git"
  "${_srcname}/Detect-It-Easy::git+https://github.com/horsicq/Detect-It-Easy.git"
  "${_srcname}/FormatDialogs::git+https://github.com/horsicq/FormatDialogs.git"
  "${_srcname}/FormatWidgets::git+https://github.com/horsicq/FormatWidgets.git"
  "${_srcname}/Formats::git+https://github.com/horsicq/Formats.git"
  "${_srcname}/QHexView::git+https://github.com/horsicq/QHexView.git"
  "${_srcname}/SpecAbstract::git+https://github.com/horsicq/SpecAbstract.git"
  "${_srcname}/StaticScan::git+https://github.com/horsicq/StaticScan.git"
  "${_srcname}/XArchive::git+https://github.com/horsicq/XArchive.git"
  "${_srcname}/XCapstone::git+https://github.com/horsicq/XCapstone.git"
  "${_srcname}/XDEX::git+https://github.com/horsicq/XDEX.git"
  "${_srcname}/XDemangle::git+https://github.com/horsicq/XDemangle.git"
  "${_srcname}/XDemangleWidget::git+https://github.com/horsicq/XDemangleWidget.git"
  "${_srcname}/XDisasm::git+https://github.com/horsicq/XDisasm.git"
  "${_srcname}/XDisasmView::git+https://github.com/horsicq/XDisasmView.git"
  "${_srcname}/XEntropyWidget::git+https://github.com/horsicq/XEntropyWidget.git"
  "${_srcname}/XGithub::git+https://github.com/horsicq/XGithub.git"
  "${_srcname}/XHashWidget::git+https://github.com/horsicq/XHashWidget.git"
  "${_srcname}/XHexEdit::git+https://github.com/horsicq/XHexEdit.git"
  "${_srcname}/XHexView::git+https://github.com/horsicq/XHexView.git"
  "${_srcname}/XLLVMDemangler::git+https://github.com/horsicq/XLLVMDemangler.git"
  "${_srcname}/XMIME::git+https://github.com/horsicq/XMIME.git"
  "${_srcname}/XMIMEWidget::git+https://github.com/horsicq/XMIMEWidget.git"
  "${_srcname}/XMemoryMapWidget::git+https://github.com/horsicq/XMemoryMapWidget.git"
  "${_srcname}/XOptions::git+https://github.com/horsicq/XOptions.git"
  "${_srcname}/XQwt::git+https://github.com/horsicq/XQwt.git"
  "${_srcname}/XShortcuts::git+https://github.com/horsicq/XShortcuts.git"
  "${_srcname}/XSingleApplication::git+https://github.com/horsicq/XSingleApplication.git"
  "${_srcname}/XStyles::git+https://github.com/horsicq/XStyles.git"
  "${_srcname}/XTranslation::git+https://github.com/horsicq/XTranslation.git"
  "${_srcname}/archive_widget::git+https://github.com/horsicq/archive_widget.git"
  "${_srcname}/build_tools::git+https://github.com/horsicq/build_tools.git"
  "${_srcname}/die_script::git+https://github.com/horsicq/die_script.git"
  "${_srcname}/die_widget::git+https://github.com/horsicq/die_widget.git"
  "${_srcname}/nfd_widget::git+https://github.com/horsicq/nfd_widget.git"
  "${_srcname}/signatures::git+https://github.com/horsicq/signatures.git"
  'detect-it-easy.desktop'
)
sha512sums=(
  'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP'
  'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP'
  'SKIP' 'SKIP' 'SKIP'
  '65f33f3c5f3d01e771d3f9c5b1d59b4cedc2441cf002f762239580592b2d98820173427d6385ac1fd339a8ae105a89705caa8540e20b3c65640f80ba4711f446'
)
_pkgname="${pkgname/-git/}"
_stop='\e[m'
_color="\e[33m"
_bold='\e[1m'
_prefix=" ${_bold}${_color}==>${_stop} "



pkgver() {
  cd "$_srcname" || return
  printf "%s" "$(git describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
  #cd "$_srcname" || return
  echo -e "${_prefix}Linking the git submodule sources into the main source folder"
  _subdirs="Controls Detect-It-Easy FormatDialogs FormatWidgets Formats QHexView SpecAbstract StaticScan XArchive XCapstone \
XDEX XDemangle XDemangleWidget XDisasm XDisasmView XEntropyWidget XGithub XHashWidget XHexEdit XHexView XLLVMDemangler XMIME \
XMIMEWidget XMemoryMapWidget XOptions XQwt XShortcuts XSingleApplication XStyles XTranslation archive_widget build_tools \
die_script die_widget nfd_widget signatures"
  for _subdir in $_subdirs; do
    if [ ! -h "${_srcname}/${_subdir}" ]; then
      rm -fr "${_srcname:?}/${_subdir}"
      ln -sf "../${_subdir}" "${_srcname}/${_subdir}"
    fi 
  done
}

build() {
  cd "$_srcname" || return
  echo -e "${_prefix}Building detect-it-easy"

  _subdirs="build_libs gui_source console_source"

  # [DEPRECATED] FIXME UPSTREAM: -Werror=format-security is causing build errors (merged upstream)
  #export CFLAGS+=" -Wno-format-security"
  #export CXXFLAGS+=" -Wno-format-security"

  for _subdir in $_subdirs; do
    pushd "$_subdir" || return
    echo -e "${_prefix}${_prefix}Building $_subdir"
    qmake-qt5 PREFIX=/usr QMAKE_CFLAGS="${CFLAGS}" QMAKE_CXXFLAGS="${CXXFLAGS}" QMAKE_LFLAGS="${LDFLAGS}" "$_subdir.pro"
    make -f Makefile clean
    make -f Makefile
    popd || return
  done

  echo -e "${_prefix}${_prefix}Running Qt's Linguist tool chain for gui_source"
  cd gui_source || return
  lupdate gui_source_tr.pro
  lrelease gui_source_tr.pro
}

package() {
  cd "$_srcname" || return

  echo -e "${_prefix}Creating the package base"
  install -d "$pkgdir"/{opt/"${_pkgname}",usr/bin,usr/share/pixmaps}
  install -d "$pkgdir/opt/${_pkgname}"/{lang,qss,info,db,signatures}

  echo -e "${_prefix}Copying the package binaries"
  install -Dm 755 build/release/die -t "$pkgdir"/opt/"${_pkgname}"
  install -Dm 755 build/release/diec -t "$pkgdir"/opt/"${_pkgname}"

  echo -e "${_prefix}Copying the package files"
  install -Dm 644 gui_source/translation/* -t "$pkgdir"/opt/"${_pkgname}"/lang
  install -Dm 644 XStyles/qss/* -t "$pkgdir"/opt/"${_pkgname}"/qss
  install -Dm 644 Detect-It-Easy/info/* -t "$pkgdir"/opt/"${_pkgname}"/info
  cp -r Detect-It-Easy/db/* -t "$pkgdir"/opt/"${_pkgname}"/db/
  install -Dm 644 signatures/crypto.db -t "$pkgdir"/opt/"${_pkgname}"/signatures

  echo -e "${_prefix}Setting up /usr/bin launchers"
  ln -s /opt/"${_pkgname}"/die "$pkgdir"/usr/bin/die
  ln -s /opt/"${_pkgname}"/diec "$pkgdir"/usr/bin/diec

  echo -e "${_prefix}Setting up desktop icon"
  convert icons/main.ico[4] "$pkgdir"/usr/share/pixmaps/"${_pkgname}".png

  echo -e "${_prefix}Setting up desktop shortcuts"
  install -Dm 644 ../"${_pkgname}".desktop -t "$pkgdir"/usr/share/applications
}

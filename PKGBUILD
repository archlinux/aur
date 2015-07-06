# Contributor: Sara <sara at archlinux dot us>
# Maintainer: aksr <aksr at t-com dot me>
_pkgname=tex_nine
pkgname=vim-${_pkgname}
pkgver=1.3.13
_scriptid=22415
pkgrel=1
pkgdesc="A semi-automatic LaTeX ftplugin with lots of firepower."
arch=('any')
url="http://www.vim.org/scripts/script.php?script_id=3508"
license=('GPL')
depends=('python2' 'vim')
optdepends=('texlive-bin: compile TeX files')
groups=('vim-plugins')
install=vimdoc.install
source=(${pkgname}.tar.gz::"http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}")
md5sums=('3a44ec79b2bb8da015035dc9efc1c2c4')
sha1sums=('480b76fe9db6081f396f25a7238ac2405d0c1727')
sha256sums=('3447255bb878d66cc4d87b6fe0f7f604f1e6f0f4b32bb2e33faa10aaa81f5ab3')

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}/ftplugin/${_pkgname}"
  sed -e 's|#!/usr/bin/python|#!/usr/bin/python2|' -i evince_dbus.py
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}/ftplugin/${_pkgname}"

  installpath="${pkgdir}/usr/share/vim/vimfiles"
  install -d $installpath/{autoload,doc,ftplugin,indent}
  install -d $installpath/ftplugin/${_pkgname}/{skeleton,snippets}
  install -Dm644 *.vim *.py *.txt $installpath/ftplugin/${_pkgname}/

  for i in skeleton snippets
  do
    install -Dm644 "${i}"/* $installpath/ftplugin/${_pkgname}/"${i}"/
  done

  cd "${srcdir}/${_pkgname}-${pkgver}"
  install -Dm644 ftplugin/*.vim $installpath/ftplugin/

  for i in autoload doc indent
  do
    install -Dm644 "${i}"/* $installpath/"${i}"/
  done

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}


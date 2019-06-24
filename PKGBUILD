# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>

pkgname=vim-grammarous
pkgver=r197.083cbee
pkgrel=1
pkgdesc='A powerful grammar checker for Vim using LanguageTool'
arch=('any')
url='https://github.com/rhysd/vim-grammarous'
license=('MIT')
groups=('vim-plugins')
depends=('vim' 'java-runtime=8' 'languagetool')
source=(https://github.com/rhysd/vim-grammarous/archive/master.zip)
sha256sums=('02dd5faac6c651f57fd0e2229c69a6dd6dfd10cf0a73571908faf1088b905ad8')

package () {
  cd "${pkgname}-master"

  # Install primary files
  install -d "$pkgdir/usr/share/vim/vimfiles"
  for _dir in autoload doc plugin; do
    cp -r "$_dir" "$pkgdir/usr/share/vim/vimfiles/$_dir"
  done

  # Use system-wide installation of LanguageTool
  echo "let g:grammarous#languagetool_cmd = 'languagetool'" > "$pkgdir/usr/share/vim/vimfiles/plugin/grammarous.system_languagetool.vim"

  # Install licence
  install -d "${pkgdir}/usr/share/licenses/${pkgname%-git}"
  grep '## License' README.md -A 100 > "${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENCE"
}

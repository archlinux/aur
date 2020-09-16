# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>

pkgname=vim-grammarous
pkgver=r199.a3d6740
pkgrel=1
pkgdesc='A powerful grammar checker for Vim using LanguageTool'
arch=('any')
url='https://github.com/rhysd/vim-grammarous'
license=('MIT')
groups=('vim-plugins')
depends=('vim' 'vim-vital' 'java-runtime=8' 'languagetool')
source=("$pkgname-$pkgver.tar.gz::https://github.com/rhysd/vim-grammarous/archive/master.tar.gz")
sha256sums=('fbe5b467172fb939dbf7a49b9b41b5d6ac47e9bd22bc584ccd504283fb940f92')

package () {
  cd "${pkgname}-master"

  # Install primary files
  install -d "$pkgdir/usr/share/vim/vimfiles"
  for _dir in autoload doc plugin; do
    cp -r "$_dir" "$pkgdir/usr/share/vim/vimfiles/$_dir"
  done

  # Remove file that would conflict with vim-vital, which is a dependency of this package instead
  rm "$pkgdir/usr/share/vim/vimfiles/autoload/vital.vim"

  # Use system-wide installation of LanguageTool
  echo "let g:grammarous#languagetool_cmd = 'languagetool'" > "$pkgdir/usr/share/vim/vimfiles/plugin/grammarous.system_languagetool.vim"

  # Install licence
  install -d "${pkgdir}/usr/share/licenses/${pkgname%-git}"
  grep '## License' README.md -A 100 > "${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENCE"
}

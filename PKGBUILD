# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>
# Contributor: nb5p

pkgname=vimcdoc
pkgver=2.4.0
pkgrel=1
pkgdesc="Vim Chinese Documentation"
url="http://vimcdoc.sf.net"
url2="http://github.com/yianwillis/vimcdoc"
arch=('any')
license=('custom:vimcdoc')
depends=('vim')
source=("https://nchc.dl.sourceforge.net/project/vimcdoc/vimcdoc/vimcdoc-$pkgver.tar.gz")
sha256sums=('08f7fb85dc5c7d2535749336d0268262d3a6be213a8bdf2d0de90073be187046')

package() {
  cd vimcdoc-$pkgver
  local _dir="$pkgdir/usr/share/vim/vimfiles"
  for __dir in *; do
    if [ -d "${__dir}" ]; then
      cd ${__dir}
      for __file in *; do
        if [ -f "${__file}" ]; then
          install -Dm644 ${__file} ${_dir}/${__dir}/${__file}
        fi
      done
      cd ..
    fi
  done
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/vimcdoc"
  rm -dr doc plugin syntax LICENSE VERSION vimcdoc.sh
  install -Dm644 * -t "$pkgdir/usr/share/doc/vimcdoc"
}

# Maintainer: Hsieh Chin Fan <typebrook@gmail.com>
pkgname=gist-lite
pkgver=0.3
pkgrel=1
pkgdesc="Bash script for gist management"
arch=(any)
gist_id=b0d2e7e67aa50298fdf8111ae7466b56
url="https://gist.github.com/$gist_id"
license=('GPL3')
depends=(git coreutils python)
source=(https://codeload.github.com/gist/$gist_id/tar.gz/v$pkgver)
md5sums=('599f16a275050b21a9cbfd67aa4fa307')

package() {
  local filename=gist

  if [[ -n $(which $filename 2>/dev/null) ]]; then
    echo 'There is already a file called "gist" in yout PATH'
    echo 
    PS3='Please enter your choice(1-3), or name this script by yourself: '
    choices=('Override it!' 'Install this script as "gist-lite"' 'Abort installation')
    select ans in "${choices[@]}"; do
      case $ans in
        ${choices[0]}) break ;;
        ${choices[1]}) filename=gist-lite; break ;;
        ${choices[2]}) exit 0 ;;
        *) 
          if [[ -n $(which $REPLY 2>/dev/null) ]]; then
            echo 'Invalid name'
          else
            filename=$REPLY
            break
          fi
          ;;
      esac
    done
  fi

  install -Dm0755 ${srcdir}/${gist_id}-${pkgver}/gist ${pkgdir}/usr/bin/$filename 2>/dev/tty
}

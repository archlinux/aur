# Maintainer: Intestinal
pkgname="xfce-simple-dark"
pkgver=9
pkgrel=1
pkgdesc="Set of dark themes for Xfce widgets, Xfce window decoration and Geany."
arch=("x86_64")
license=('GPLv3, Copyright 2017-2020 Simon Krauter')
source=("https://github.com/trustable-code/$pkgname/archive/v$pkgver.tar.gz")
url="https://github.com/trustable-code/xfce-simple-dark"
md5sums=('94dea0ec74580f118b6273624406878f')
_directories=(
  "Xfce-Simple-Dark_widgets"
  "Xfce-Simple-Dark_xfwm_x24"
  "Xfce-Simple-Dark_xfwm_x28"
  "Xfce-Simple-Dark_xfwm_x32"
  "Xfce-Simple-Dark_xfwm_x36"
  "Xfce-Simple-Dark_xfwm_x40"
  "Xfce-Simple-Dark_xfwm_x44"
  "Xfce-Simple-Dark_xfwm_x48"
)
_themes="/home/$USER/.themes"
_geany_config="/home/$USER/.config/geany/colorschemes"
_geany_file="simple-dark.conf"
_sub_srcdir="$srcdir/Xfce-Simple-Dark-$pkgver"

package() {
  # Create Xfce themes
  if [ ! -d $_themes ]; then
    mkdir -p $_themes
  fi
  for directory in "${_directories[@]}"
  do
    if [ -L $_themes/$directory ]; then
      echo "Unlink $_themes/$directory"
      unlink $_themes/$directory
    fi
    ln -s "$_sub_srcdir/$directory" $_themes
    echo "Create link $_sub_srcdir/$directory -> $_themes/$directory"
  done

  # Create Geany theme
  if [ ! -d $_geany_config ]; then
    mkdir -p $_geany_config
  fi
  if [ -L $_geany_config/$_geany_file ]; then
      echo "Unlink $_geany_config/$_geany_file"
      unlink $_geany_config/$_geany_file
  fi
  ln -s $_sub_srcdir/geany/$_geany_file $_geany_config
  echo "Create link $_sub_srcdir/geany/$_geany_file -> $_geany_config/$_geany_file"
}

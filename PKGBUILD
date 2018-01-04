# Maintainer: Marcel Hoppe <hoppe.marcel@gmail.com>
# https://github.com/rvm/rvm/

pkgname=rvm
pkgbase=${pkgname}
pkgver=1.29.3
pkgrel=2
pkgdesc='RVM is a command-line tool which allows you to easily install, manage, and work with multiple ruby environments from interpreters to sets of gems.'
arch=('any')
url="https://rvm.io/"
license=('Apache License')
depends=('gdbm' 'openssl'  'libffi'  'libyaml'  'gmp'  'zlib')
provides=('rvm' 'ruby')
conflicts=('ruby')
source=("https://raw.githubusercontent.com/rvm/rvm/master/binscripts/rvm-installer"
        "rvm_init.sh"
        "rvm.sh"
        "rvmrc")
sha256sums=('f6eb5b10cf6f544c5d75511fc9a34e32da2e8ff1882e0f50be13ea5a6db2b8e1'
            'f09f9a144a3d33409c1f394d7ba37f783b8034fbd6405e8536bf9bfec87c6af0'
            '48b6e852380c9e9b8d3b3c3ce8e50d397429dd1efeee06a75e121df1a2df47e2'
            'f9444e8c5817c4a59fc701b8a71cef0a7114a9dda549ad82c5800983f1a54738')

build() {
  gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
  chmod +x rvm-installer
  ./rvm-installer --path $srcdir/rvm --ignore-dotfiles --version ${pkgver}
}

package() {
  cd "$srcdir"
  DESTDIR="$pkgdir/usr/share"
  DESTETC="$pkgdir/etc"
  mkdir -p "$DESTDIR"
	cp -r "rvm" "$DESTDIR/"
  mkdir -p "$DESTETC/profile.d"
  cp rvm_init.sh "$DESTETC/profile.d/"
#  cp rvm.sh "$DESTETC/profile.d/"
  cp rvmrc "$DESTETC/"
  mkdir -p "$DESTETC/skel/.rvm"
  cd "$DESTETC/skel/.rvm"
  mkdir archives  bin  environments  gems  gems_cache  hooks  log  pkgs  repos  rubies  rubygems  src  tmp  user  wrappers
}

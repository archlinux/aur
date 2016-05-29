# Maintainer: Hythlodaeus <matteodelseppiaomm@gmail.com>
pkgname=beef-xss-git
pkgver=0.4.7.0
pkgrel=1
pkgdesc="The Browser Exploitation Framework"
arch=('any')
url="http://beefproject.com/"
license=('GPL')
conflicts=('beef-xss-git')
provides=('beef-xss-git' 'sqlite')
prepare() {
           echo Installing needed ruby and rake 
           sudo pacman -S ruby rake sqlite
}

package() {
           git clone https://github.com/beefproject/beef.git
           cd beef          
           gem install bundler
           ~/.gem/ruby/2.3.0/bin/bundle install
           cd ..
           sudo mv -v beef /usr/share/beef
           sudo ln -sv -t /usr/bin/ /usr/share/beef/*
           sudo unlink /usr/bin/beef
           echo Creating essential symlinks... 
           sudo ln -s /usr/share/beef/beef /usr/bin/beef-xss
           echo Enter "beef" in your terminal to start using it
}

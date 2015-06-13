# Maintainer: shmilee <shmilee[dot]zju[at]gmail[dot]com>

_npmname=hexo-cli
_modules=yes
#"hexo": "^3.0.0",
#"hexo-generator-archive": "^0.1.0",
#"hexo-generator-category": "^0.1.0",
#"hexo-generator-index": "^0.1.0",
#"hexo-generator-tag": "^0.1.0",
#"hexo-renderer-ejs": "^0.1.0",
#"hexo-renderer-stylus": "^0.2.0",
#"hexo-renderer-marked": "^0.2.4",
#"hexo-server": "^0.1.2
_plugins=(hexo-deployer-git
          hexo-deployer-rsync
          hexo-deployer-openshift
          hexo-deployer-ftpsync
          hexo-deployer-heroku
          hexo-renderer-pandoc
          hexo-renderer-less
          hexo-uglify
          hexo-html-minifier
          hexo-clean-css
          hexo-generator-sitemap
          hexo-generator-feed
          hexo-migrator-wordpress)

pkgname=nodejs-hexo-cli
pkgver=0.1.7
pkgrel=1
pkgdesc="Command line interface for Hexo 3.0.0 or higher. A fast, simple & powerful blog framework, powered by Node.js."
arch=('any')
url="http://hexo.io"
license=('MIT')
depends=('nodejs')
conflicts=('nodejs-hexo')
options=(!strip)

package() {
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  install -dm755 "$_npmdir"
  
  cd "$_npmdir"
  npm install --user root -g --prefix "$pkgdir/usr" $_npmname@$pkgver

  if [[ $_modules == yes ]]; then
    cd $_npmname/assets/
    npm install
    #other plugins
    for _p in ${_plugins[@]}; do
      npm install $_p --save
    done
  fi
  rmdir "$pkgdir"/usr/etc
}

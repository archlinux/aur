# Maintainer: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>

pkgname=graphiql-app
pkgver=0.7.2
pkgrel=1
pkgdesc='A light, Electron-based wrapper around GraphiQL.'
arch=(any)
url='https://github.com/skevy/graphiql-app'
license=(MIT)
depends=(nodejs npm electron)
source=(
  https://github.com/skevy/$pkgname/archive/v$pkgver.tar.gz
  graphiql-app.svg::https://upload.wikimedia.org/wikipedia/commons/1/17/GraphQL_Logo.svg
  graphiql-app
  graphiql-app.desktop
)
sha1sums=(
  13f2aff8ed8db66a7f2d0c7d74dd9820ff1f26d1
  5291daa645b8f31fc8755e359d00fbfb21bf94db
  ab93a32b54870933b1cd5d11a1112bb2318f08e4
  53949e275525271e05b6b57d2c6685c5a72f4051
)

package() {
  mkdir -p "$pkgdir/opt"
  cp -r "$srcdir/$pkgname-$pkgver" "$pkgdir/opt/graphiql-app"

  cd "$pkgdir/opt/graphiql-app"

  npm install
  npm run build

  find "$pkgdir" -type f -exec chmod 644 {} \;
  find "$pkgdir" -mindepth 1 -type d -exec chmod 755 {} \;

  install -Dm 755 "$srcdir/graphiql-app" "$pkgdir/usr/bin/graphiql-app"
  install -Dm 644 "$srcdir/graphiql-app.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/graphiql-app.svg"
  install -Dm 644 "$srcdir/graphiql-app.desktop" "$pkgdir/usr/share/applications/graphiql-app.desktop"
}

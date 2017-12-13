#Maintainer: Aaron Miller <aaronm@cldtk.com>
pkgname=dynamodb
pkgver=20170216
pkgrel=2
pkgdesc="Amazon DynamoDB Local instance. Amazon DynamoDB is a fast and flexible NoSQL database service for all applications that need consistent, single-digit millisecond latency at any scale."
_upstreamver=2017-02-16
pkgver=${_upstreamver//-/_}
arch=('any')
url="http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Tools.DynamoDBLocal.html"
license=('custom:DynamoDB Local License Agreement')
depends=('java-environment' 'bash' 'lib32-glibc')
install=dynamodb.install
source=('config.cfg' 'dynamodb' 'dynamodb.service' "http://dynamodb-local.s3-website-us-west-2.amazonaws.com/dynamodb_local_${_upstreamver}.tar.gz")
sha256sums=('6a2d271d62de9e4e48bd4bd866a72283dec6bacc097c2f6262ab19fc0feb34d9'
            '2c4d4840735b2dd8b73c3a3132d23dc1e586a758cb699ea0ccf74943657bda69'
            '4024db91c14087290fbce707cadead1ea013dc845216e9758a485b7d2f67c3ca'
            'd79732d7cd6e4b66fbf4bb7a7fc06cb75abbbe1bbbfb3d677a24815a1465a0b2')

package() {
  cd "$pkgdir"
  mkdir -p "usr/share/dynamodb" "usr/share/licenses/dynamodb" "usr/lib/systemd/system" "usr/bin" "etc/dynamodb" "var/lib/dynamodb"


  cp -dr --no-preserve=ownership "$srcdir/DynamoDBLocal_lib/" "./usr/share/dynamodb"

  install -Dm755 "$srcdir/dynamodb" "./usr/bin"
  install -Dm644 "$srcdir/config.cfg" "./etc/dynamodb"
  install -Dm644 "$srcdir/DynamoDBLocal.jar" "./usr/share/dynamodb"
  install -Dm644 "$srcdir/dynamodb.service" "./usr/lib/systemd/system"
  install -Dm644 "$srcdir/LICENSE.txt" "./usr/share/licenses/dynamodb"
}

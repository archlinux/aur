#Maintainer: Dean Galvin <deangalvin3@gmail.com>
pkgname=dynamodb
pkgver=1.0
pkgrel=1
pkgdesc="Amazon DynamoDB Local instance. Amazon DynamoDB is a fast and flexible NoSQL database service for all applications that need consistent, single-digit millisecond latency at any scale."
arch=('any')
url="http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Tools.DynamoDBLocal.html"
license=('custom:DynamoDB Local License Agreement')
depends=('java-runtime')
install=dynamodb.install
source=('config.cfg' 'dynamodb' 'dynamodb.service' "http://dynamodb-local.s3-website-us-west-2.amazonaws.com/dynamodb_local_2015-07-16_${pkgver}.tar.gz")
sha256sums=('6a2d271d62de9e4e48bd4bd866a72283dec6bacc097c2f6262ab19fc0feb34d9' '9a8c0b87b9a3529cb07c6362d586c12e304d2958da71961d51dfc557a258b848' '4024db91c14087290fbce707cadead1ea013dc845216e9758a485b7d2f67c3ca' '5868fd4b9f624001cda88059af7a54f412a4794dea0d3497e7c57470bfb272fa')


package() {
  cd "$pkgdir"
  mkdir -p "usr/share/dynamodb" "usr/share/licenses/dynamodb" "usr/lib/systemd/system" "usr/bin" "etc/dynamodb"


  cp -dr --no-preserve=ownership "$srcdir/DynamoDBLocal_lib/" "./usr/share/dynamodb"

  install -Dm755 "$srcdir/dynamodb" "./usr/bin"
  install -Dm644 "$srcdir/config.cfg" "./etc/dynamodb"
  install -Dm644 "$srcdir/DynamoDBLocal.jar" "./usr/share/dynamodb"
  install -Dm644 "$srcdir/dynamodb.service" "./usr/lib/systemd/system"
  install -Dm644 "$srcdir/LICENSE.txt" "./usr/share/licenses/dynamodb"
}

#Submitter: Ian Ker-Seymer <i.kerseymer@gmail.com>
#Maintainer: Julian Xhokaxhiu <info at julianxhokaxhiu dot com>

pkgname=aws-ecs-cli
pkgver=1.8.0
pkgrel=1
pkgdesc="The Amazon EC2 Container Service (Amazon ECS) command line interface (CLI) provides high-level commands to simplify creating, updating, and monitoring clusters and tasks from a local development environment."
depends=('docker')
makedepends=('curl')
arch=('x86_64')
options=(!strip)
source=(
  "https://s3.amazonaws.com/amazon-ecs-cli/ecs-cli-linux-amd64-latest"
)
url="https://docs.aws.amazon.com/AmazonECS"
license=("Apache")
md5sums=("$(curl -s https://s3.amazonaws.com/amazon-ecs-cli/ecs-cli-linux-amd64-latest.md5)")

pkgver() {
  cd "$srcdir"
  chmod +x "ecs-cli-linux-amd64-latest"
  ./ecs-cli-linux-amd64-latest -v | sed -rn 's/ecs-cli version ([0-9\.]+) \(\w+\)/\1/p'
}

package() {
  cd "$srcdir"
  chmod +x "ecs-cli-linux-amd64-latest"
  install -Dm755 "ecs-cli-linux-amd64-latest" "$pkgdir/usr/bin/ecs-cli"
}

# Maintainer: Tyler Cook <tcc@sandpolis.com>
pkgbase=sandpolis
pkgname=('sandpolis-server' 'sandpolis-viewer' 'sandpolis-viewer-cli')
pkgver=5.0.1
pkgrel=1
pkgdesc='Ultimate remote management utility'
arch=('any')
url='https://github.com/Subterranean-Security/Sandpolis'
license=('Apache 2')
depends=('java-runtime>=11')
makedepends=()
source=(https://github.com/Subterranean-Security/Sandpolis/releases/download/v${pkgver}/SandpolisInstaller-offline-${pkgver}.jar)
sha512sums=('d6e5415a9cf6237772a4ffa18a4bb9f6afb357496fc628d5de208e46fc977c29d9b78bb3798c651f4d3eee0bfe54b34ed95936678e54769005a2c2fe8f70cecc')

package_sandpolis-server() {
  conflicts=('sandpolis-server')
  provides=('sandpolis-server')
  install=sandpolis-server.install

  # Temporary until next release
  declare -a serverDependencies=('sandpolis-client-mega-5.0.1.jar' 'sandpolis-core-ipc-5.0.1.jar' 'sandpolis-core-net-5.0.1.jar' \
    'sandpolis-core-profile-5.0.1.jar' 'sandpolis-core-storage-hibernate-5.0.1.jar' 'sandpolis-core-instance-5.0.1.jar' \
    'sandpolis-core-util-5.0.1.jar' 'sandpolis-core-proto-5.0.1.jar' 'sandpolis-core-soi-5.0.1.jar' 'guava-27.1-jre.jar' \
    'h2-1.4.199.jar' 'netty-handler-4.1.36.Final.jar' 'netty-resolver-dns-4.1.36.Final.jar' 'netty-codec-dns-4.1.36.Final.jar' \
    'netty-codec-4.1.36.Final.jar' 'netty-transport-4.1.36.Final.jar' 'netty-buffer-4.1.36.Final.jar' 'netty-resolver-4.1.36.Final.jar' \
    'netty-common-4.1.36.Final.jar' 'hibernate-c3p0-5.4.0.Final.jar' 'sqlite-dialect-0.1.0.jar' 'hibernate-core-5.4.2.Final.jar' \
    'javax.persistence-api-2.2.jar' 'zipset-1.1.0.jar' 'logback-classic-1.2.3.jar' 'pf4j-2.6.0.jar' 'slf4j-api-1.7.26.jar' \
    'logback-core-1.2.3.jar' 'compact-classloader-1.2.1.jar' 'jansi-1.18.jar' 'protobuf-java-3.7.1.jar' 'jaxb-runtime-2.3.1.jar' \
    'jaxb-api-2.3.1.jar' 'commons-validator-1.6.jar' 'failureaccess-1.0.1.jar' 'listenablefuture-9999.0-empty-to-avoid-conflict-with-guava.jar' \
    'jsr305-3.0.2.jar' 'checker-qual-2.5.2.jar' 'error_prone_annotations-2.2.0.jar' 'j2objc-annotations-1.1.jar' \
    'animal-sniffer-annotations-1.17.jar' 'java-semver-0.9.0.jar' 'hibernate-commons-annotations-5.1.0.Final.jar' \
    'jboss-logging-3.3.2.Final.jar' 'javassist-3.24.0-GA.jar' 'byte-buddy-1.9.10.jar' 'antlr-2.7.7.jar' \
    'jboss-transaction-api_1.2_spec-1.1.1.Final.jar' 'jandex-2.0.5.Final.jar' 'classmate-1.3.4.jar' 'javax.activation-api-1.2.0.jar' \
    'dom4j-2.1.1.jar' 'c3p0-0.9.5.2.jar' 'commons-beanutils-1.9.2.jar' 'commons-digester-1.8.1.jar' 'commons-logging-1.2.jar' \
    'commons-collections-3.2.2.jar' 'txw2-2.3.1.jar' 'istack-commons-runtime-3.0.7.jar' 'stax-ex-1.8.jar' 'FastInfoset-1.2.15.jar' \
    'mchange-commons-java-0.2.11.jar')

  # Install binaries to /usr/share/java/sandpolis-server
  install -m644 -D "$srcdir/sandpolis-server-vanilla-$pkgver.jar" \
      "$pkgdir/usr/share/java/sandpolis-server/sandpolis-server-vanilla-$pkgver.jar"

  # Install dependencies to /usr/share/java/sandpolis-server/lib  
  install -d "$pkgdir/usr/share/java/sandpolis-server/lib"
  for dep in ${serverDependencies[@]}; do
    cp "$srcdir/$dep" "$pkgdir/usr/share/java/sandpolis-server/lib/$dep"
  done

  # Install script stubs to /usr/bin
  install -m755 -D "$startdir/sandpolis-server.sh" "$pkgdir/usr/bin/sandpolis-server"
  sed -i "s/pkgver/$pkgver/" "$pkgdir/usr/bin/sandpolis-server"

  # Setup database directory in /var/lib/sandpolis-server/db
  install -d "$pkgdir/var/lib/sandpolis-server/db"

  # Setup gen directory in /var/lib/sandpolis-server/gen
  install -d "$pkgdir/var/lib/sandpolis-server/gen"

  # Setup log directory in /var/log/sandpolis-server
  install -d "$pkgdir/var/log/sandpolis-server"

  # Install systemd unit
  install -m644 -D "$startdir/sandpolis-server.service" "$pkgdir/usr/lib/systemd/system/sandpolisd.service"
}

package_sandpolis-viewer() {
  conflicts=('sandpolis-viewer')
  provides=('sandpolis-viewer')

  # Temporary until next release
  declare -a viewerJfxDependencies=('javafx-fxml-11.0.2-linux.jar' 'javafx-controls-11.0.2-linux.jar' 'javafx-controls-11.0.2.jar' \
    'javafx-graphics-11.0.2-linux.jar' 'javafx-graphics-11.0.2.jar' 'javafx-base-11.0.2-linux.jar' 'javafx-base-11.0.2.jar' \
    'sandpolis-core-viewer-5.0.1.jar' 'sandpolis-core-ipc-5.0.1.jar' 'sandpolis-core-net-5.0.1.jar' 'sandpolis-core-profile-5.0.1.jar' \
    'sandpolis-core-instance-5.0.1.jar' 'sandpolis-core-util-5.0.1.jar' 'sandpolis-core-proto-5.0.1.jar' 'sandpolis-core-soi-5.0.1.jar' \
    'guava-27.1-jre.jar' 'fxgraph-0.0.3.jar' 'commons-validator-1.6.jar' 'netty-handler-4.1.36.Final.jar' 'netty-resolver-dns-4.1.36.Final.jar' \
    'netty-codec-dns-4.1.36.Final.jar' 'netty-codec-4.1.36.Final.jar' 'netty-transport-4.1.36.Final.jar' 'netty-buffer-4.1.36.Final.jar' \
    'netty-resolver-4.1.36.Final.jar' 'netty-common-4.1.36.Final.jar' 'hibernate-core-5.4.2.Final.jar' 'javax.persistence-api-2.2.jar' \
    'logback-classic-1.2.3.jar' 'pf4j-2.6.0.jar' 'slf4j-api-1.7.26.jar' 'logback-core-1.2.3.jar' 'compact-classloader-1.2.1.jar' 'jansi-1.18.jar' \
    'protobuf-java-3.7.1.jar' 'failureaccess-1.0.1.jar' 'listenablefuture-9999.0-empty-to-avoid-conflict-with-guava.jar' 'jsr305-3.0.2.jar' \
    'checker-qual-2.5.2.jar' 'error_prone_annotations-2.2.0.jar' 'j2objc-annotations-1.1.jar' 'animal-sniffer-annotations-1.17.jar' \
    'org.abego.treelayout.core-1.0.3.jar' 'commons-beanutils-1.9.2.jar' 'commons-digester-1.8.1.jar' 'commons-logging-1.2.jar' \
    'commons-collections-3.2.2.jar' 'java-semver-0.9.0.jar' 'hibernate-commons-annotations-5.1.0.Final.jar' 'jboss-logging-3.3.2.Final.jar' \
    'javassist-3.24.0-GA.jar' 'byte-buddy-1.9.10.jar' 'antlr-2.7.7.jar' 'jboss-transaction-api_1.2_spec-1.1.1.Final.jar' 'jandex-2.0.5.Final.jar' \
    'classmate-1.3.4.jar' 'jaxb-runtime-2.3.1.jar' 'jaxb-api-2.3.1.jar' 'javax.activation-api-1.2.0.jar' 'dom4j-2.1.1.jar' 'txw2-2.3.1.jar' \
    'istack-commons-runtime-3.0.7.jar' 'stax-ex-1.8.jar' 'FastInfoset-1.2.15.jar')

  # Install binaries to /usr/share/java/sandpolis-viewer
  install -m644 -D "$srcdir/sandpolis-viewer-jfx-$pkgver.jar" \
      "$pkgdir/usr/share/java/sandpolis-viewer/sandpolis-viewer-jfx-$pkgver.jar"

  # Install dependencies to /usr/share/java/sandpolis-viewer/lib
  install -d "$pkgdir/usr/share/java/sandpolis-viewer/lib"
  for dep in ${viewerJfxDependencies[@]}; do
    cp "$srcdir/$dep" "$pkgdir/usr/share/java/sandpolis-viewer/lib/$dep"
  done

  # Install script stubs to /usr/bin
  install -m755 -D "$startdir/sandpolis-viewer.sh" "$pkgdir/usr/bin/sandpolis-viewer"
  sed -i "s/pkgver/$pkgver/" "$pkgdir/usr/bin/sandpolis-viewer"
}

package_sandpolis-viewer-cli() {
  conflicts=('sandpolis-viewer-cli')
  provides=('sandpolis-viewer-cli')

  # Temporary until next release
  declare -a viewerCliDependencies=('sandpolis-core-viewer-5.0.1.jar' 'sandpolis-core-ipc-5.0.1.jar' 'sandpolis-core-net-5.0.1.jar' \
    'sandpolis-core-instance-5.0.1.jar' 'sandpolis-core-util-5.0.1.jar' 'sandpolis-core-proto-5.0.1.jar' 'sandpolis-core-soi-5.0.1.jar' \
    'logback-classic-1.2.3.jar' 'logback-core-1.2.3.jar' 'lanterna-3.0.1.jar' 'netty-handler-4.1.36.Final.jar' 'netty-resolver-dns-4.1.36.Final.jar' \
    'netty-codec-dns-4.1.36.Final.jar' 'netty-codec-4.1.36.Final.jar' 'netty-transport-4.1.36.Final.jar' 'netty-buffer-4.1.36.Final.jar' \
    'netty-resolver-4.1.36.Final.jar' 'netty-common-4.1.36.Final.jar' 'pf4j-2.6.0.jar' 'slf4j-api-1.7.26.jar' 'compact-classloader-1.2.1.jar' \
    'guava-27.1-jre.jar' 'javax.persistence-api-2.2.jar' 'jansi-1.18.jar' 'protobuf-java-3.7.1.jar' 'commons-validator-1.6.jar' \
    'failureaccess-1.0.1.jar' 'listenablefuture-9999.0-empty-to-avoid-conflict-with-guava.jar' 'jsr305-3.0.2.jar' 'checker-qual-2.5.2.jar' \
    'error_prone_annotations-2.2.0.jar' 'j2objc-annotations-1.1.jar' 'animal-sniffer-annotations-1.17.jar' 'java-semver-0.9.0.jar' \
    'commons-beanutils-1.9.2.jar' 'commons-digester-1.8.1.jar' 'commons-logging-1.2.jar' 'commons-collections-3.2.2.jar')

  # Install binaries to /usr/share/java/sandpolis-viewer-cli
  install -m644 -D "$srcdir/sandpolis-viewer-cli-$pkgver.jar" \
      "$pkgdir/usr/share/java/sandpolis-viewer-cli/sandpolis-viewer-cli-$pkgver.jar"

  # Install dependencies to /usr/share/java/sandpolis-viewer-cli/lib
  install -d "$pkgdir/usr/share/java/sandpolis-viewer-cli/lib"
  for dep in ${viewerCliDependencies[@]}; do
    cp "$srcdir/$dep" "$pkgdir/usr/share/java/sandpolis-viewer-cli/lib/$dep"
  done

  # Install script stubs to /usr/bin
  install -m755 -D "$startdir/sandpolis-viewer-cli.sh" "$pkgdir/usr/bin/sandpolis-viewer-cli"
  sed -i "s/pkgver/$pkgver/" "$pkgdir/usr/bin/sandpolis-viewer-cli"
}

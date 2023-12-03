# Maintainer: Fabio Manganiello <fabio@manganiello.tech>

pkgname=platypush-git
pkgver=0.50.3.r565.d484a34c
pkgrel=1
pkgdesc="Universal multi-platform command executor and automation manager"
arch=('any')
license=('MIT')
url="https://git.platypush.tech/platypush/platypush"
makedepends=('git')
depends=(
    'python'
    'python-alembic'
    'python-bcrypt'
    'python-croniter'
    'python-dateutil'
    'python-docutils'
    'python-flask'
    'python-frozendict'
    'python-magic'
    'python-marshmallow'
    'python-marshmallow-dataclass'
    'python-pip'
    'python-psutil'
    'python-pytz'
    'python-redis'
    'python-requests'
    'python-rsa'
    'python-sqlalchemy'
    'python-tornado'
    'python-websocket-client'
    'python-websockets'
    'python-wheel'
    'python-yaml'
    'python-zeroconf'
    'redis'
    'sudo'
)

optdepends=(
    'ffmpeg: Audio, streaming and several camera integrations'
	'libtorrent: Support for torrent download'
	'opencv: Support for cameras and image processing over the OpenCV integration'
    'py-trello: Trello integration'
	'python-aiohttp: SmartThings support'
	'python-aioxmpp: XMPP support'
	'python-bleak: Bluetooth low-energy devices support'
	'python-bme280: Support for the BME280 digital sensor over I2C interface'
	'python-deepspeech: Mozilla Deepspeech integration'
	'python-defusedxml: RSS and DBus integration support'
	'python-dropbox: Dropbox integration'
	'python-feedparser: RSS integration support'
	'python-google-api-python-client: Support for several Google integrations'
    'python-google-cloud-texttospeech: Support for Google Cloud text-to-speech integration'
    'python-google-cloud-translate: Support for the Google Translate integration'
    'python-gpsd-git: Support for the GPS integration and several GPS devices'
    'python-graphyte: Graphite integration'
	'python-icalendar: Support for calendar integrations'
	'python-imapclient: Mail integrations'
	'python-irc: IRC integration'
	'python-inotify: Support for filesystem monitoring integrations'
	'python-kafka: Kafka integration support'
	'python-keras: Tensorflow integration'
	'python-kodi-json: Support for the Kodi integration'
    'python-linode_api4: Linode cloud integration'
	'python-matrix-nio: Matrix integration'
	'python-mpd2: MPD/Mopidy integration support'
	'python-mpv: mpv integration'
	'python-ndeflib: NFC tags integration'
	'python-nfcpy: NFC tags integration'
	'python-nmap: nmap integration'
	'python-numpy: Strongly advised for any camera, sound, voice or ML-based integration'
	'python-oauth2client: Support for several Google integrations'
    'python-paho-mqtt: MQTT integrations support'
	'python-pandas: Tensorflow integration'
	'python-paramiko: SSH support'
	'python-phue: Philips Hue (and compatible) devices support'
	'python-pillow: Support for several camera integrations and QR codes'
	'python-plexapi: Support for the Plex integration'
	'python-py-cpuinfo: System information plugin'
	'python-pybluez: Bluetooth support'
	'python-pychromecast: Chromecast support'
	'python-pyclip: Clipboard integration'
	'python-pycups: Printers integration'
	'python-pydbus: DBus and Bluetooth integration'
	'python-pylast: Last.fm scrobbling support'
	'python-pyotp: OTP support'
	'python-pyscard: Support for the smart card integration'
	'python-pyserial: Arduino/serial device support'
	'python-qrcode: QR code integration'
	'python-rpi-gpio: Support for GPIO integrations for Raspberry Pi (and compatible) devices'
	'python-rtmidi: MIDI integration'
	'python-snowboy: Snowboy integration'
	'python-sounddevice: Sound integration'
	'python-telegram-bot: Telegram integration'
	'python-tensorflow: Tensorflow integration'
    'python-todoist-python: Todoist integration'
	'python-twilio: Twilio integration'
	'python-vlc: VLC integration'
	'python-watchdog: File monitor support'
    'python-weasyprint: PDF generation support'
	'pyzbar: QR code and barcodes integration'
    'youtube-dl: Support for downloading/streaming YouTube videos, as well as other video platforms'
)

conflicts=('platypush')
provides=('platypush')
options=(!strip)
source=("master.tar.gz::https://git.platypush.tech/platypush/platypush/archive/master.tar.gz")
sha256sums=('SKIP')

package() {
    cd "${srcdir}/platypush"
    python3 setup.py install --root="${pkgdir}/" --optimize=1

    install -m755 -d "${pkgdir}/usr/lib/systemd/user"
    install -m644 "${srcdir}/platypush/examples/systemd/platypush.service" "${pkgdir}/usr/lib/systemd/user"

    echo
    echo
    echo ---------------------------------------------
    echo You can start the Platypush service through
    echo systemctl --user start platypush.
    echo
    echo Remember to enable/start the Redis service
    echo before starting Platypush.
    echo ---------------------------------------------
    echo
    echo
}

